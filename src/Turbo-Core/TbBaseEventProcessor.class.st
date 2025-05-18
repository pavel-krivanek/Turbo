Class {
	#name : 'TbBaseEventProcessor',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'space'
	],
	#category : 'Turbo-Core-Space-Support',
	#package : 'Turbo-Core',
	#tag : 'Space-Support'
}

{ #category : 'as yet unclassified' }
TbBaseEventProcessor class >> space:  aSpace [
	^ self new
		space: aSpace;
		yourself
]

{ #category : 'event firing' }
TbBaseEventProcessor >> dispatchEvent: anEvent target: aTarget [
	aTarget dispatchEvent: anEvent
]

{ #category : 'event firing' }
TbBaseEventProcessor >> fireEvent: anEvent [
	<return: #BlEvent>

	^ TbEvent fireEvent: anEvent
]

{ #category : 'accessing' }
TbBaseEventProcessor >> space [
	^ space
]

{ #category : 'accessing' }
TbBaseEventProcessor >> space: aSpace [
	space := aSpace
]
