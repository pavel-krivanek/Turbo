"
I delegate all events of type ==eventClass== or ones that inherit from it to the event target.

I hold a strong reference to the event target
"
Class {
	#name : 'TbEventDelegator',
	#superclass : 'TbBasicEventHandler',
	#instVars : [
		'eventClass',
		'eventTarget'
	],
	#category : 'Turbo-Core-Events-Handling',
	#package : 'Turbo-Core',
	#tag : 'Events-Handling'
}

{ #category : 'instance creation' }
TbEventDelegator class >> delegate: anEventClass to: anEventTarget [
	^ self new
		eventClass: anEventClass;
		eventTarget: anEventTarget;
		yourself
]

{ #category : 'accessing' }
TbEventDelegator >> eventClass [
	^ eventClass
]

{ #category : 'accessing' }
TbEventDelegator >> eventClass: anObject [
	eventClass := anObject
]

{ #category : 'accessing' }
TbEventDelegator >> eventTarget [
	^ eventTarget
]

{ #category : 'accessing' }
TbEventDelegator >> eventTarget: anObject [
	eventTarget := anObject
]

{ #category : 'api - event managing' }
TbEventDelegator >> handleEvent: anEvent [
	self eventTarget dispatchEvent: anEvent
]

{ #category : 'api - event managing' }
TbEventDelegator >> wantsEvent: anEvent [
	^ anEvent class == self eventClass or: [ anEvent class inheritsFrom: self eventClass ]
]
