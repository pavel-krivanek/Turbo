"
I log all key press events and allow users to detect what keys are pressed at any time.

I allow ===BlKeyboardProcessor=== to sent key still pressed event every frame if there is at least one pressed key
"
Class {
	#name : #TbKeyboardBuffer,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'events'
	],
	#category : #'Turbo-Core-Space-Support'
}

{ #category : #'adding / removing' }
TbKeyboardBuffer >> add: anEvent [
	events at: anEvent key put: anEvent
]

{ #category : #accessing }
TbKeyboardBuffer >> eventAt: aKey [
	<return: #BlKeyDownEvent>
	
	^ events at: aKey
]

{ #category : #accessing }
TbKeyboardBuffer >> events [
	^ events
]

{ #category : #testing }
TbKeyboardBuffer >> hasEvent: aKey [
	"Return true if there is a buffered event for a given key"
	<return: #Boolean>
	
	^ events includesKey: aKey
]

{ #category : #initialization }
TbKeyboardBuffer >> initialize [
	super initialize.
	
	events := Dictionary new
]

{ #category : #testing }
TbKeyboardBuffer >> isEmpty [
	^ events isEmpty
]

{ #category : #testing }
TbKeyboardBuffer >> isNotEmpty [
	^ events isNotEmpty
]

{ #category : #testing }
TbKeyboardBuffer >> isPressed: aKey [
	"Return true if a given key is pressed, false otherwise"
	<return: #Boolean>

	^ self hasEvent: aKey
]

{ #category : #printing }
TbKeyboardBuffer >> printOn: aStream [

	aStream nextPut: $(.
	self events values
		do: [ :anEvent | aStream nextPutAll: anEvent key name asString ]
		separatedBy: [ aStream nextPutAll: ' ' ].
	aStream nextPut: $)
]

{ #category : #'adding / removing' }
TbKeyboardBuffer >> remove: anEvent [
	events removeKey: anEvent key
]
