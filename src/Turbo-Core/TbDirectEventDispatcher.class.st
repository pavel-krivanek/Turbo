"
I am an event dispatcher that directly dispatches events to the registered event handlers.
I do not support event bubbling. If you need events to be dispatched through a composition tree you might want to use ${class:BlBubblingEventDispatcher}$.

Example:

[[[
BlDirectEventDispatcher on: BlElement new
]]]

"
Class {
	#name : 'TbDirectEventDispatcher',
	#superclass : 'TbEventDispatcher',
	#instVars : [
		'owner',
		'filters',
		'handlers',
		'shortcutHandler'
	],
	#category : 'Turbo-Core-Events-Handling',
	#package : 'Turbo-Core',
	#tag : 'Events-Handling'
}

{ #category : 'instance creation' }
TbDirectEventDispatcher class >> new [
	self error: 'Do not create an instance of ', self name, ' using new. Please use #on: instead'
]

{ #category : 'instance creation' }
TbDirectEventDispatcher class >> on: aTBlEventTarget [
	<return: #BlDirectEventDispatcher>

	self
		assert: [ aTBlEventTarget isNotNil ]
		description: [ 'Event target must not be nil' ].

	^ self basicNew
		initialize;
		owner: aTBlEventTarget;
		yourself
]

{ #category : 'api - adding/removing' }
TbDirectEventDispatcher >> addEventFilter: aFilter [
	"Event filters receive events before general event handlers.
	Their main goal is to prevent some specific events from being handled by basic handlers.
	For that custom filters should mark event as ==consumed: true== which instantly stops propagation"

	"It is not very common to have event filters so we initialize registry lazily"
	filters ifNil: [
		filters := self defaultFilterRegistry ].
	filters add: aFilter.

	"send hook AFTER filter is added"
	aFilter onInstalledIn: self owner
]

{ #category : 'api - adding/removing' }
TbDirectEventDispatcher >> addEventHandler: aHandler [
	
	"It is not very common to have event handlers so we initialize registry lazily"
	handlers ifNil: [
		handlers := self defaultHandlerRegistry ].
	handlers add: aHandler.

	"send hook AFTER handler is added"
	aHandler onInstalledIn: self owner
]

{ #category : 'initialization' }
TbDirectEventDispatcher >> defaultFilterRegistry [
	^ TbBloc preferableEventHandlerRegistry new
]

{ #category : 'initialization' }
TbDirectEventDispatcher >> defaultHandlerRegistry [
	^ TbBloc preferableEventHandlerRegistry new
]

{ #category : 'api - event managing' }
TbDirectEventDispatcher >> dispatchEvent: anEvent next: aBlEventDispatcherChain [
	<return: #BlEvent>
	
	anEvent isConsumed
		ifTrue: [ ^ anEvent ].
	
	anEvent target == self owner
		ifTrue: [ anEvent arrivedTarget: self owner. ]
		ifFalse: [ anEvent forwardingTarget: self owner ].

	"filters initialized lazily, do nothing if there are none of them"
	filters ifNotNil: [ :theFilters |
		theFilters dispatchEvent: anEvent ].

	anEvent isConsumed
		ifTrue: [ ^ anEvent ].

	"handlers initialized lazily, do nothing if there are none of them"
	handlers ifNotNil: [ :theHandlers |
		theHandlers dispatchEvent: anEvent ].
	
	anEvent isConsumed
		ifTrue: [ ^ anEvent ].

	"shortcutHandler is special case, treat it differently"
	(shortcutHandler wantsEvent: anEvent)
		ifTrue: [ shortcutHandler handleEvent: anEvent ].
		
	^ anEvent
]

{ #category : 'api - accessing' }
TbDirectEventDispatcher >> handlersDo: aBlock [
	"Evaulate a given block with every event handler as an argument"

	handlers ifNotNil: [ :aRegistry | aRegistry handlers do: aBlock ]
]

{ #category : 'api - testing' }
TbDirectEventDispatcher >> hasHandler: anEventHandler [
	^ handlers
		ifNil: [ false ]
		ifNotNil: [ handlers hasHandler: anEventHandler ]
]

{ #category : 'initialization' }
TbDirectEventDispatcher >> initialize [
	super initialize.

	"Note, that we do not expose filters and handlers to the outer worlds with getters because it is not part
	of our public api. Additionally we want to treat shortcutHandler differently. By convention
	shortcutHandler always presents in a simple dispatcher. It is not memory efficient to create an instance
	of handler registry just for a single shortcut handler, that we know, always presents.
	However, shortcut handler is of type handler and *virtually* belongs to handlers registry. It is just
	not visible to users, think of it as implementation detail"
	filters := nil. "BlHandlerRegistry"
	handlers := nil. "BlHandlerRegistry"
	shortcutHandler := TbShortcutHandler new
]

{ #category : 'api - accessing' }
TbDirectEventDispatcher >> owner [
	<return: #TBlEventTarget>

	self
		assert: [ owner isNotNil ]
		description: [ 'Can not access owner if it does not exist' ].

	^ owner
]

{ #category : 'private - accessing' }
TbDirectEventDispatcher >> owner: aTBlEventTarget [
	owner := aTBlEventTarget
]

{ #category : 'printing' }
TbDirectEventDispatcher >> printOn: aStream [
	aStream nextPutAll: self type, ' event dispatcher for '.
	self owner printOn: aStream
]

{ #category : 'api - adding/removing' }
TbDirectEventDispatcher >> removeEventFilter: aFilter [

	filters remove: aFilter.
	"free memory as soon as we got rid of all event filters"
	filters isEmpty
		ifTrue: [ filters := nil ].
	
	aFilter onUninstalledIn: self owner
]

{ #category : 'api - adding/removing' }
TbDirectEventDispatcher >> removeEventHandler: anHandler [
	(self hasHandler: anHandler)
		ifFalse: [ ^ self ].

	handlers
		ifNil: [ ^ self ].
	handlers remove: anHandler.
	"free memory as soon as we got rid of all event handlers"
	handlers isEmpty
		ifTrue: [ handlers := nil ].

	anHandler onUninstalledIn: self owner
]

{ #category : 'api - adding/removing' }
TbDirectEventDispatcher >> removeEventHandlers [
	"Remove all my event handlers"
	handlers ifNil: [ ^ self ].
	
	handlers do: [ :aHandler | self removeEventHandler: aHandler ]
]

{ #category : 'api - adding/removing' }
TbDirectEventDispatcher >> removeEventHandlersSuchThat: aBlock [
	"remove all event handlers for those aBlock returns true"
	| toBeRemoved |
	handlers
		ifNil: [ ^ self ].
	
	toBeRemoved := handlers removeAllSuchThat: aBlock.
	handlers isEmpty
		ifTrue: [ handlers := nil ].
	
	toBeRemoved do: [ :aHandler | aHandler onUninstalledIn: self owner ]
]

{ #category : 'private - accessing' }
TbDirectEventDispatcher >> shortcutHandler [
	^ shortcutHandler
]

{ #category : 'api - accessing' }
TbDirectEventDispatcher >> type [
	<return: #String>

	^ 'Direct'
]

{ #category : 'api - event managing' }
TbDirectEventDispatcher >> wantsEvent: anEvent [
	"Return true if there are any filters or handlers interesting in a given event,
	false otherwise"
	<return: #Boolean>

	"first ask shortcutHandler because it always presents"
	(shortcutHandler wantsEvent: filters)
		ifTrue: [ ^ true ].

	(filters isNotNil and: [ filters anySatisfy: [ :aFilter | aFilter wantsEvent: anEvent ] ])
		ifTrue: [ ^ true ].

	(handlers isNotNil and: [ handlers anySatisfy: [ :aHandler | aHandler wantsEvent: anEvent ] ])
		ifTrue: [ ^ true ].

	^ false
]
