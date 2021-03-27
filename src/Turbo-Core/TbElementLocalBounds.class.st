Class {
	#name : #TbElementLocalBounds,
	#superclass : #TbElementBounds,
	#instVars : [
		'extent',
		'position'
	],
	#category : #'Turbo-Core-Basic-Bounds'
}

{ #category : #converting }
TbElementLocalBounds >> asRectangle [
	<return: #Rectangle>
	
	 ^ self position extent: self extent
]

{ #category : #accessing }
TbElementLocalBounds >> bounds [
	<return: #BlBounds>

	^ BlBounds origin: self position extent: self extent
]

{ #category : #'geometry - accessing' }
TbElementLocalBounds >> center [
	"Return a point representing a geometrical center of this bounds"
	<return: #Point>
	
	^ self position + (self extent / 2.0)
]

{ #category : #accessing }
TbElementLocalBounds >> extent [
	^ extent
]

{ #category : #accessing }
TbElementLocalBounds >> extent: anObject [
	extent := anObject
]

{ #category : #accessing }
TbElementLocalBounds >> height [
	^ self extent y
]

{ #category : #'geometry bounds' }
TbElementLocalBounds >> inChild: anElement [
	<return: #BlElementBounds>

	^ BlElementBoundsInChild new
		originalElement: self referenceElement;
		referenceElement: anElement;
		bounds: (anElement globalBoundsToMine: (BlBounds new left: 0 top: 0 corner: self extent) fromParent: self referenceElement);
		yourself
]

{ #category : #'geometry bounds' }
TbElementLocalBounds >> inLocal [
	<return: #BlElementBounds>

	^ BlElementBoundsInLocal new
		referenceElement: self referenceElement;
		bounds: (BlBounds new left: 0 top: 0 corner: self extent);
		yourself
]

{ #category : #'geometry bounds' }
TbElementLocalBounds >> inParent [
	<return: #BlElementBounds>
	
	^ BlElementBoundsInParent new
		originalElement: self referenceElement;
		referenceElement: self referenceElement;
		bounds: (self localBoundsToParent: (BlBounds new left: 0 top: 0 corner: self extent));
		yourself
]

{ #category : #'geometry bounds' }
TbElementLocalBounds >> inParent: anElement [
	<return: #BlElementBounds>
	| subParent |
	
	subParent := self referenceElement.
	self referenceElement withAllParentsDo: [ :aParentElement |
		(aParentElement hasParent and: [ aParentElement parent == anElement ])
			ifTrue: [ subParent := aParentElement ] ].

	^ BlElementBoundsInParent new
		originalElement: self referenceElement;
		referenceElement: subParent;
		bounds: (anElement localBoundsToMine: (BlBounds new left: 0 top: 0 corner: self extent) fromChild: self referenceElement);
		yourself
]

{ #category : #'geometry bounds' }
TbElementLocalBounds >> inSpace [
	<return: #BlElementBounds>
	
	^ BlElementBoundsInSpace new
		referenceElement: self referenceElement;
		bounds: (self localBoundsToSpace: (BlBounds new left: 0 top: 0 corner: self extent));
		yourself
]

{ #category : #initialization }
TbElementLocalBounds >> initialize [
	super initialize.

	position := 0@0.
	extent := 0@0
]

{ #category : #accessing }
TbElementLocalBounds >> position [
	"Return bounds position (an origin) as a Point"
	<return: #Point>
	
	^ position
]

{ #category : #accessing }
TbElementLocalBounds >> position: anObject [
	position := anObject
]

{ #category : #'geometry bounds' }
TbElementLocalBounds >> transformed [
	<return: #BlElementBounds>

	^ self inLocal transformed
]

{ #category : #accessing }
TbElementLocalBounds >> width [
	^ self extent x
]
