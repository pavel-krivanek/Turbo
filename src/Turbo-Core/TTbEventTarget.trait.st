"
I implement a basic infrastructure of event management.
Any object that needs to be able to handle events should use me.
"
Trait {
	#name : #TTbEventTarget,
	#category : #'Turbo-Core-Events-Handling'
}

{ #category : #'event management' }
TTbEventTarget >> addEventFilter: anEventHandler [
	self eventDispatcher addEventFilter: anEventHandler
]

{ #category : #'event management' }
TTbEventTarget >> addEventFilterOn: anEventClass do: aBlock [
	self addEventFilter: (TbEventHandler on: anEventClass do: aBlock)
]

{ #category : #'event management' }
TTbEventTarget >> addEventHandler: anEventHandler [
	self eventDispatcher addEventHandler: anEventHandler
]

{ #category : #'event management' }
TTbEventTarget >> addEventHandlerOn: anEventClass do: aBlock [
	self addEventHandler: (TbEventHandler on: anEventClass do: aBlock)
]

{ #category : #'shortcut management' }
TTbEventTarget >> addShortcut: aShortcut [
	self shortcuts add: aShortcut
]

{ #category : #'event management' }
TTbEventTarget >> buildEventDispatchChain: aBlEventDispatcherChain [
	"Note: Dispatcher chain is persistent - I return a new instance"
	<return: #BlEventDispatcherChain>
	| aResultChain |

	aResultChain := aBlEventDispatcherChain.
	aResultChain := aResultChain withNext: self eventDispatcher.

	self hasNextEventTarget
		ifTrue: [ aResultChain := self nextEventTarget buildEventDispatchChain: aResultChain ].

	^ aResultChain
]

{ #category : #'event management' }
TTbEventTarget >> dispatchEvent: anEvent [
	"I only call my event dispatcher, so the event can be only handled by my event handlers/filters"

	anEvent hasSource
		ifFalse: [ anEvent source: anEvent ].

	anEvent target: self.
	anEvent forwardingTarget: self.

	(self eventDispatcher wantsEvent: anEvent)
		ifTrue: [ self eventDispatcher dispatchEvent: anEvent ]
]

{ #category : #'event management accessing' }
TTbEventTarget >> eventDispatcher [
	"Return an object responsible for event dispatching"
	<return: #BlDirectEventDispatcher>

	^ self explicitRequirement
]

{ #category : #'event management' }
TTbEventTarget >> fireEvent: anEvent [
	"I fire provided event building an event dispatcher chain
	(from target to the root element) and dispatch the event with it.
	anEvent must not be nil"

	TbEvent fireEvent: anEvent target: self
]

{ #category : #'event management accessing' }
TTbEventTarget >> hasNextEventTarget [
	"Return true if this event target has a logical successor within a dispatch chain.
	For example, in case of visual components next event target is a parent, meaning
	that first event is handled by child and the dispatched to the parent if that event
	was not consumed"
	<return: #Boolean>

	^ false
]

{ #category : #'event management accessing' }
TTbEventTarget >> nextEventTarget [
	"Return next event target that should be contained in dispatch chain.
	Note: returned object must use TBlEventTarget trait!"
	<return: #TBlEventTarget>

	self error: 'Override me if there is a next event target.'
]

{ #category : #'event management' }
TTbEventTarget >> removeEventFilter: anEventHandler [
	self eventDispatcher removeEventFilter: anEventHandler
]

{ #category : #'event management' }
TTbEventTarget >> removeEventHandler: anEventHandler [
	self eventDispatcher removeEventHandler: anEventHandler
]

{ #category : #'event management' }
TTbEventTarget >> removeEventHandlersSuchThat: aBlock [
	self eventDispatcher removeEventHandlersSuchThat: aBlock
]

{ #category : #'shortcut management' }
TTbEventTarget >> removeShortcut: aShortcut [
	self shortcuts remove: aShortcut
]

{ #category : #'shortcut management' }
TTbEventTarget >> shortcuts [
	^ self eventDispatcher shortcutHandler shortcuts
]

{ #category : #'event management' }
TTbEventTarget >> when: anEventClass do: aBlock [
	self addEventHandlerOn: anEventClass do: aBlock
]
