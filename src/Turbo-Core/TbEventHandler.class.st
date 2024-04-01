"
I am a scriptable event handler that allows users to assign a valuable action to the event of chosen type.

Example:

[[[
BlEventHandler
	on: BlClickEvent
	do: [ :anEvent | self inform: 'Click!' ]
]]]
"
Class {
	#name : #TbEventHandler,
	#superclass : #TbBasicEventHandler,
	#instVars : [
		'action',
		'eventClass'
	],
	#category : #'Turbo-Core-Events-Handling'
}

{ #category : #'instance creation' }
TbEventHandler class >> on: anEventClass do: aBlock [
	^ self new
		eventClass: anEventClass;
		action: aBlock;
		yourself
]

{ #category : #'instance creation' }
TbEventHandler class >> on: anEventClass sendTo: anObject [
	^ self
		on: anEventClass
		do: [ :event | event sendTo: anObject ]
]

{ #category : #comparing }
TbEventHandler >> = anotherObject [
	self species == anotherObject species
		ifFalse: [ ^ false ].

	^ anotherObject eventClass = self eventClass
		and: [ anotherObject action = self action ]
]

{ #category : #'private - accessing' }
TbEventHandler >> action [
	^ action
]

{ #category : #'private - accessing' }
TbEventHandler >> action: anObject [
	action := anObject
]

{ #category : #'private - accessing' }
TbEventHandler >> eventClass [
	^ eventClass
]

{ #category : #'private - accessing' }
TbEventHandler >> eventClass: anObject [
	eventClass := anObject
]

{ #category : #'api - event managing' }
TbEventHandler >> handleEvent: anEvent [
	self action cull: anEvent
]

{ #category : #comparing }
TbEventHandler >> hash [
	^ self action hash bitXor: self eventClass hash
]

{ #category : #printing }
TbEventHandler >> printOn: aStream [
	aStream
		nextPutAll: 'Event handler of ';
		nextPutAll: self eventClass name
]

{ #category : #'api - event managing' }
TbEventHandler >> wantsEvent: anEvent [
	^ anEvent class == self eventClass or: [ anEvent class inheritsFrom: self eventClass ]
]
