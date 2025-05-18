Class {
	#name : 'TbElementBoundsInLocal',
	#superclass : 'TbElementComputedBounds',
	#category : 'Turbo-Core-Basic-Bounds',
	#package : 'Turbo-Core',
	#tag : 'Basic-Bounds'
}

{ #category : 'geometry bounds' }
TbElementBoundsInLocal >> inParent [
	<return: #BlElementBounds>

	^ TbElementBoundsInParent new
		originalElement: self referenceElement;
		referenceElement: self referenceElement;
		bounds: (self localBoundsToParent: self bounds copy);
		yourself
]

{ #category : 'geometry bounds' }
TbElementBoundsInLocal >> inSpace [
	<return: #BlElementBounds>

	^ TbElementBoundsInSpace new
		referenceElement: self referenceElement;
		bounds: (self localBoundsToSpace: self bounds copy);
		yourself
]
