"
I am the abstract root class for effects.
I define the default drawing strategy (before & after).
My subclasses can be composed as a chain of effects.
I can influence the bounds of my owner (used to clip my owner).
"
Class {
	#name : 'TbElementEffect',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'input'
	],
	#category : 'Turbo-Core-Effect',
	#package : 'Turbo-Core',
	#tag : 'Effect'
}

{ #category : 'as yet unclassified' }
TbElementEffect class >> on: anObject [
	^ self new
		on: anObject;
		yourself
]

{ #category : 'geometry' }
TbElementEffect >> computeBounds: aBlBounds [
	"Compute effect bounds based on provided geometry bounds.
	Default implementation simply returns given bounds"
	<return: #BlBounds>

	^ aBlBounds
]

{ #category : 'geometry' }
TbElementEffect >> effectBounds [
	^ (self effectBounds: TbBounds new) asRectangle
]

{ #category : 'geometry' }
TbElementEffect >> effectBounds: aBlBounds [
	^ self computeBounds: (aBlBounds rectangle: self input visualBounds)
]

{ #category : 'accessing' }
TbElementEffect >> input [
	^ input
]

{ #category : 'accessing' }
TbElementEffect >> input: anElementOrEffect [
	input := anElementOrEffect
]

{ #category : 'initialization' }
TbElementEffect >> on: anElement [
	self input 
		ifNil: [ self input: anElement ] 
		ifNotNil: [ :anInput | anInput on: anElement ]
]
