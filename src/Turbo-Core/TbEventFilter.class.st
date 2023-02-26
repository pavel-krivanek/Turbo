Class {
	#name : #TbEventFilter,
	#superclass : #TbBasicEventHandler,
	#instVars : [
		'eventClass'
	],
	#category : #'Turbo-Core-Events-Handling'
}

{ #category : #'instance creation' }
TbEventFilter class >> on: anEventClass [
	<return: #BlEventFilter>

	^ self new eventClass: anEventClass
]

{ #category : #'private - accessing' }
TbEventFilter >> eventClass [
	<return: #'BlEvent class'>

	^ eventClass
]

{ #category : #'private - accessing' }
TbEventFilter >> eventClass: aBlEventClass [
	self
		assert: [ eventClass isNil ]
		description: [ 'Filter event class can not be changed once set' ].

	eventClass := aBlEventClass
]

{ #category : #'api - event managing' }
TbEventFilter >> handleEvent: anEvent [
	anEvent consumed: true
]

{ #category : #printing }
TbEventFilter >> printOn: aStream [
	aStream
		nextPutAll: 'Event filter of ';
		nextPutAll: self eventClass name
]

{ #category : #'api - event managing' }
TbEventFilter >> wantsEvent: anEvent [
	^ anEvent class == self eventClass or: [ anEvent class inheritsFrom: self eventClass ]
]
