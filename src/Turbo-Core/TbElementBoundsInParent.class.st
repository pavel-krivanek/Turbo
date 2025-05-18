Class {
	#name : 'TbElementBoundsInParent',
	#superclass : 'TbElementComputedBounds',
	#instVars : [
		'originalElement'
	],
	#category : 'Turbo-Core-Basic-Bounds',
	#package : 'Turbo-Core',
	#tag : 'Basic-Bounds'
}

{ #category : 'geometry bounds' }
TbElementBoundsInParent >> inChild: anElement [
	<return: #BlElementBounds>
	| aParentElement |
	
	aParentElement := self referenceElement hasParent
		ifTrue: [ self referenceElement parent ]
		ifFalse: [ self referenceElement ].

	^ TbElementBoundsInChild new
		originalElement: self originalElement;
		referenceElement: anElement;
		bounds: (anElement globalBoundsToMine: self bounds copy fromParent: aParentElement);
		yourself
]

{ #category : 'geometry bounds' }
TbElementBoundsInParent >> inParent [
	<return: #BlElementBoundsInParent>

	self referenceElement hasParent
		ifFalse: [ ^ self ].

	^ TbElementBoundsInParent new
		originalElement: self originalElement;
		referenceElement: self referenceElement parent;
		bounds: (self referenceElement parent localBoundsToParent: self bounds copy);
		yourself
]

{ #category : 'accessing' }
TbElementBoundsInParent >> originalElement [
	<return: #BlElement>

	^ originalElement
]

{ #category : 'accessing' }
TbElementBoundsInParent >> originalElement: anElement [
	originalElement := anElement
]
