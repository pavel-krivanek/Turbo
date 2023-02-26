"
I am a special type of element bounds with an ability to be in-place converted between coordinate systems (local <-> parent <-> global <-> window)
"
Class {
	#name : #TbElementComputedBounds,
	#superclass : #TbElementBounds,
	#instVars : [
		'bounds'
	],
	#category : #'Turbo-Core-Basic-Bounds'
}

{ #category : #converting }
TbElementComputedBounds >> asRectangle [
	<return: #Rectangle>
	
	 ^ self bounds asRectangle
]

{ #category : #asserting }
TbElementComputedBounds >> assertNotOriginal [
	self
		assert: [ self referenceElement bounds ~~ self ]
		description: [ 'Can not modify original reference element bounds' ]
]

{ #category : #accessing }
TbElementComputedBounds >> bounds [
	<return: #BlBounds>

	^ bounds
]

{ #category : #accessing }
TbElementComputedBounds >> bounds: aBlBounds [
	bounds := aBlBounds
]

{ #category : #accessing }
TbElementComputedBounds >> center [
	"Return a point representing a geometrical center of this bounds.
	I am an optimised version that benefits by optimisations of underlying bounds object"
	<return: #Point>
	
	^ self bounds center
]

{ #category : #accessing }
TbElementComputedBounds >> extent [
	"Return extent of current bounds"
	<return: #Point>

	^ self bounds extent
]

{ #category : #'geometry bounds' }
TbElementComputedBounds >> inChild: anElement [
	<return: #BlElementBounds>

	^ TbElementBoundsInChild new
		originalElement: self originalElement;
		referenceElement: anElement;
		bounds: (anElement globalBoundsToMine: self bounds copy fromParent: self referenceElement);
		yourself
]

{ #category : #'geometry bounds' }
TbElementComputedBounds >> inLocal [
	^ self
]

{ #category : #'geometry bounds' }
TbElementComputedBounds >> inParent [
	self assertNotOriginal.
	
	"If reference element does not have parent local bounds can
	be treated as bounds in parent, so just return self"
	self referenceElement hasParent
		ifFalse: [ ^ self ].

	self localBoundsToParent: bounds.

	"Update our reference element to be a parent of the current reference element"
	referenceElement := self referenceElement parent
]

{ #category : #'geometry bounds' }
TbElementComputedBounds >> inParent: anElement [
	<return: #BlElementBounds>
	| subParent |
	
	subParent := self referenceElement.
	self referenceElement withAllParentsDo: [ :aParentElement |
		(aParentElement hasParent and: [ aParentElement parent == anElement ])
			ifTrue: [ subParent := aParentElement ] ].

	^ TbElementBoundsInParent new
		originalElement: self referenceElement;
		referenceElement: subParent;
		bounds: (anElement localBoundsToMine: self bounds copy fromChild: self referenceElement);
		yourself
]

{ #category : #'geometry bounds' }
TbElementComputedBounds >> inSpace [
	self assertNotOriginal.
	
	"If reference element does not have parent local bounds can
	be treated as bounds in parent, so just return self"
	self referenceElement hasParent
		ifFalse: [ ^ self ].

	self localBoundsToSpace: bounds.

	"Update our reference element to be a parent of the current reference element"
	referenceElement := self referenceElement topMostParent
]

{ #category : #accessing }
TbElementComputedBounds >> position [
	"Return bounds position (an origin) as a Point"
	<return: #Point>
	
	^ self bounds origin
]

{ #category : #'geometry bounds' }
TbElementComputedBounds >> transformed [
	self assertNotOriginal.
	
	self localBoundsToTransformed: bounds
]
