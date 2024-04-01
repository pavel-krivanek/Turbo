"
I represent an element transformation and support both 2D and 3D transformations.

For optimization purposes I use 2D matrix if 3D transformation was not requested. As soon as I'm transformed in 3D all further transformation will also happen with the help of 3D matrix.
"
Class {
	#name : #TbElementTransformation,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'owner',
		'matrix'
	],
	#category : #'Turbo-Core-Basic-Transformations'
}

{ #category : #accessing }
TbElementTransformation >> inSpace [
	"Return a transformation that represents a convertion from space coordinates
	to the local coordinates of the owner element of this transformation"
	<return: #BlElementTransformation>
	| aMatrix |
	
	aMatrix := self matrix copy.
	aMatrix translateBy: self owner position.
	
	self owner allParentsDo: [ :anElement |
		aMatrix multiplyBy: anElement transformation matrix.
		aMatrix translateBy: anElement position ].
	
	^ TbElementAbsoluteTransformation matrix: aMatrix
]

{ #category : #invalidation }
TbElementTransformation >> invalidateMatrix [
	self subclassResponsibility
]

{ #category : #bounds }
TbElementTransformation >> inverseTransformBounds: aBounds [
	"In-place transform given BlBounds according to my transformation.
	(global to local transformation)"
	<return: #BlBounds>

	^ self matrix inverted transformBounds: aBounds
]

{ #category : #bounds }
TbElementTransformation >> inverseTransformPoint: aPoint [
	"Apply an inversed transformation on a given point and return a result.
	Note: Throws BlSingularMatrixError if underlying matrix is singular"
	<return: #Point>

	aPoint isPoint
		ifFalse: [ self error: 'Only points can be transformed!' ].

	^ self matrix inverted transformPoint: aPoint
]

{ #category : #bounds }
TbElementTransformation >> invert [
	matrix := self matrix inverted
]

{ #category : #bounds }
TbElementTransformation >> inverted [
	^ self copy invert
]

{ #category : #testing }
TbElementTransformation >> is2D [
	"Return true if my current transformation is in 2D space, false otherwise"
	<return: #Boolean>
	
	^ self subclassResponsibility
]

{ #category : #testing }
TbElementTransformation >> is3D [
	<return: #Boolean>
	
	^ self subclassResponsibility
]

{ #category : #testing }
TbElementTransformation >> isIdentity [
	"Return true if I represent an identity transformation, false otherwise"
	<return: #Boolean>
	
	^ self subclassResponsibility
]

{ #category : #testing }
TbElementTransformation >> isPureTranslation [
	"Return true if the receiver specifies no rotation or scaling and represents only translation in xy 2D plane"
	<return: #Boolean>
	
	^ false
]

{ #category : #accessing }
TbElementTransformation >> matrix [
	<return: #BlMatrix>

	^ self subclassResponsibility
]

{ #category : #accessing }
TbElementTransformation >> owner [
	<return: #BlElement>
	
	^ owner
]

{ #category : #accessing }
TbElementTransformation >> owner: anElement [
	owner := anElement
]

{ #category : #copying }
TbElementTransformation >> postCopy [
	matrix := matrix copy
]

{ #category : #bounds }
TbElementTransformation >> transformBounds: aBounds [
	"In-place transform given BlBounds according to my transformation.
	(local to global transformation)"
	<return: #BlBounds>

	^ self matrix transformBounds: aBounds
]

{ #category : #bounds }
TbElementTransformation >> transformPoint: aPoint [
	"Transform given 2D point according to my transformation and return a transformed result point.
	(local to global transformation)"
	<return: #Point>
	
	^ self matrix transformPoint: aPoint
]
