Class {
	#name : #TbElementChangeRecord,
	#superclass : #Object,
	#instVars : [
		'changedValue',
		'wasNotified'
	],
	#category : #'Turbo-Core-Basic-Changes'
}

{ #category : #accessing }
TbElementChangeRecord >> beNotified [
	wasNotified := true
]

{ #category : #accessing }
TbElementChangeRecord >> changedValue [
	^ changedValue
]

{ #category : #accessing }
TbElementChangeRecord >> changedValue: anObject [
	changedValue := anObject
]

{ #category : #printing }
TbElementChangeRecord >> gtDisplayOn: aStream [
	self changedValue gtDisplayOn: aStream
]

{ #category : #initialization }
TbElementChangeRecord >> initialize [
	super initialize.
	
	wasNotified := false
]

{ #category : #printing }
TbElementChangeRecord >> printOn: aStream [
	
	self changedValue printOn: aStream.
	
	self wasNotified
		ifTrue: [ aStream nextPutAll: ' => Notified' ].
]

{ #category : #testing }
TbElementChangeRecord >> wasNotified [
	<return: #Boolean>

	^ wasNotified
]
