Class {
	#name : #TbBoundsCache,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'owner',
		'boundsInSpace',
		'boundsInLocal',
		'transformedBounds',
		'geometryBounds',
		'geometryBoundsInSpace',
		'boundsInParent'
	],
	#category : #'Turbo-Core-Basic-Support'
}

{ #category : #'as yet unclassified' }
TbBoundsCache class >> on: anElement [
	^ self new owner: anElement
]

{ #category : #accessing }
TbBoundsCache >> boundsInLocal [
	^ boundsInLocal ifNil: [
		boundsInLocal := (self owner boundsInLocal: TbBounds new) asRectangle ]
]

{ #category : #accessing }
TbBoundsCache >> boundsInParent [
	self deprecated: 'Use `element bounds inParent` instead'.

	^ boundsInParent ifNil: [
		boundsInParent := (self owner boundsInParent: BlBounds new) asRectangle ]
]

{ #category : #accessing }
TbBoundsCache >> boundsInSpace [
	^ boundsInSpace ifNil: [
		boundsInSpace := (self owner boundsInSpace: BlBounds new) asRectangle ]
]

{ #category : #accessing }
TbBoundsCache >> geometryBounds [
	^ geometryBounds ifNil: [
		geometryBounds := (self owner geometryBounds: BlBounds new) asRectangle ]
]

{ #category : #accessing }
TbBoundsCache >> geometryBoundsInSpace [
	^ geometryBoundsInSpace
		ifNil: [ geometryBoundsInSpace := (self owner geometryBoundsInSpace: BlBounds new) asRectangle ]
]

{ #category : #invalidation }
TbBoundsCache >> invalidateBoundsInLocal [
	"Bounds properties in local coordinates change than and only than when extent changes"

	boundsInLocal := nil.
	geometryBounds := nil.

	self invalidateBoundsInSpace
]

{ #category : #invalidation }
TbBoundsCache >> invalidateBoundsInSpace [

	boundsInSpace := nil.
	geometryBoundsInSpace := nil.
	transformedBounds := nil.
	boundsInParent := nil.

	self owner childrenDo: [ :anElement |
		anElement boundsCache invalidateBoundsInSpace ]
]

{ #category : #accessing }
TbBoundsCache >> owner [
	^ owner
]

{ #category : #accessing }
TbBoundsCache >> owner: anElement [
	owner := anElement
]

{ #category : #accessing }
TbBoundsCache >> transformedBounds [
	^ transformedBounds ifNil: [
		transformedBounds := (self owner transformedBounds: BlBounds new) asRectangle ]
]
