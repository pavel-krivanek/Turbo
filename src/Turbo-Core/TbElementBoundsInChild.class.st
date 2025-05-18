Class {
	#name : 'TbElementBoundsInChild',
	#superclass : 'TbElementComputedBounds',
	#instVars : [
		'originalElement'
	],
	#category : 'Turbo-Core-Basic-Bounds',
	#package : 'Turbo-Core',
	#tag : 'Basic-Bounds'
}

{ #category : 'geometry bounds' }
TbElementBoundsInChild >> inParent [
	<return: #BlElementBoundsInParent>

	self referenceElement hasParent
		ifFalse: [ ^ self ].

	^ TbElementBoundsInParent new
		originalElement: self originalElement;
		referenceElement: self referenceElement;
		bounds: (self referenceElement localBoundsToParent: self bounds copy);
		yourself
]

{ #category : 'geometry bounds' }
TbElementBoundsInChild >> inSpace [
	<return: #BlElementBounds>

	^ TbElementBoundsInSpace new
		referenceElement: self referenceElement;
		bounds: (self localBoundsToSpace: self bounds copy);
		yourself
]

{ #category : 'accessing' }
TbElementBoundsInChild >> originalElement [
	<return: #BlElement>

	^ originalElement
]

{ #category : 'accessing' }
TbElementBoundsInChild >> originalElement: anElement [
	originalElement := anElement
]
