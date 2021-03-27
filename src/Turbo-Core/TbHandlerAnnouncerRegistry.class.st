Class {
	#name : #TbHandlerAnnouncerRegistry,
	#superclass : #TbHandlerRegistry,
	#instVars : [
		'announcer'
	],
	#category : #'Turbo-Core-Events-Handling'
}

{ #category : #testing }
TbHandlerAnnouncerRegistry class >> isSupported [
	<return: #Boolean>
	
	^ true
]

{ #category : #accessing }
TbHandlerAnnouncerRegistry class >> label [
	^ 'Announcer'
]

{ #category : #'api - adding / removing' }
TbHandlerAnnouncerRegistry >> add: aHandler [
	"Adds a given event handler to the registry.
	aHandler must not be nil and must not be already registered"

	self announcer subscriptions add: (BlHandlerAnnouncementSubscription new subscriber: aHandler)
]

{ #category : #accessing }
TbHandlerAnnouncerRegistry >> announcer [
	<return: #Announcer>

	^ announcer
]

{ #category : #'api - event managing' }
TbHandlerAnnouncerRegistry >> dispatchEvent: anEvent [
	"Dispatch a given event to all registered handlers that are interested in it"
	
	self announcer announce: anEvent
]

{ #category : #'api - enumerating' }
TbHandlerAnnouncerRegistry >> do: aBlock [
	"Evaluate aBlock with each registered handler as the argument"

	self announcer subscriptions protected: [
		self announcer subscriptions subscriptions do: [ :aSubscription | aBlock value: aSubscription subscriber ] ]
]

{ #category : #'api - accessing' }
TbHandlerAnnouncerRegistry >> handlers [
	"Return an immutable collection of all registered event handlers"
	<return: #Array of: #TBlEventHandler>
	
	^ self subscriptions collect: #subscriber
]

{ #category : #initialization }
TbHandlerAnnouncerRegistry >> initialize [
	super initialize.
	
	announcer := Announcer new
]

{ #category : #'api - enumerating' }
TbHandlerAnnouncerRegistry >> numberOfHandlers [
	"Return amount of registered event handlers"
	<return: #Number>

	^ self announcer numberOfSubscriptions
]

{ #category : #'api - adding / removing' }
TbHandlerAnnouncerRegistry >> remove: aHandler [
	"Remove given event handler from my registry.
	Provided handler must not be nil and must be registered"

	self announcer subscriptions removeSubscriber: aHandler
]

{ #category : #'api - adding / removing' }
TbHandlerAnnouncerRegistry >> removeAllSuchThat: aBlock [
	"Remove all event handlers for which aBlock returns true.
	Return a collection of removed handlers"
	<return: #SequenceableCollection of: #BlBasicEventHandler>
	| toBeRemoved |

	toBeRemoved := #().
	self announcer subscriptions protected: [
		toBeRemoved := self announcer subscriptions subscriptions
			select: [ :aSubscription | aBlock value: aSubscription subscriber ]
			thenCollect: [ :aSubscription | aSubscription subscriber ].
		self announcer subscriptions subscriptions removeAllSuchThat: [ :aSubscription | aBlock value: aSubscription subscriber ] ].

	^ toBeRemoved asArray
]

{ #category : #accessing }
TbHandlerAnnouncerRegistry >> subscriptions [
	<return: #Set of: #AnnouncementSubscription>

	^ self announcer subscriptions protected: [ self announcer subscriptions subscriptions copy asArray ]
]
