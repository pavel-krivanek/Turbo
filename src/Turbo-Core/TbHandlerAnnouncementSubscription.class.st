Class {
	#name : 'TbHandlerAnnouncementSubscription',
	#superclass : 'Object',
	#instVars : [
		'subscriber'
	],
	#category : 'Turbo-Core-Events-Handling',
	#package : 'Turbo-Core',
	#tag : 'Events-Handling'
}

{ #category : 'comparing' }
TbHandlerAnnouncementSubscription >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	^ anotherObject subscriber = self subscriber
]

{ #category : 'announcing' }
TbHandlerAnnouncementSubscription >> deliver: anAnnouncement [

	(self handlesAnnouncement: anAnnouncement)
		ifTrue: [ self subscriber handleEvent: anAnnouncement ]
]

{ #category : 'testing' }
TbHandlerAnnouncementSubscription >> handlesAnnouncement: anAnnouncement [
	<return: #Boolean>

	^ self subscriber wantsEvent: anAnnouncement
]

{ #category : 'comparing' }
TbHandlerAnnouncementSubscription >> hash [
	^ self class hash bitXor: self subscriber hash
]

{ #category : 'accessing' }
TbHandlerAnnouncementSubscription >> subscriber [
	<return: #TBlEventHandler>

	^ subscriber
]

{ #category : 'accessing' }
TbHandlerAnnouncementSubscription >> subscriber: aTBlEventHandler [
	subscriber := aTBlEventHandler
]
