"
I represent an absolute transformation defined only by transformation matrix
"
Class {
	#name : #TbElementAbsoluteTransformation,
	#superclass : #TbElementTransformation,
	#category : #'Turbo-Core-Basic-Transformations'
}

{ #category : #accessing }
TbElementAbsoluteTransformation class >> matrix: aBlMatrix [
	^ self new matrix: aBlMatrix
]

{ #category : #initialization }
TbElementAbsoluteTransformation >> initialize [
	super initialize.
	
	matrix := BlMatrix2D new
]

{ #category : #invalidation }
TbElementAbsoluteTransformation >> invalidateMatrix [
	"Do nothing, since matrix is statically defined"
]

{ #category : #testing }
TbElementAbsoluteTransformation >> is2D [
	"Return true if my current transformation is in 2D space, false otherwise"
	<return: #Boolean>

	^ self matrix is2D
]

{ #category : #testing }
TbElementAbsoluteTransformation >> is3D [
	"Return true if my current transformation is in 3D space, false otherwise"
	<return: #Boolean>

	^ self matrix is3D
]

{ #category : #testing }
TbElementAbsoluteTransformation >> isIdentity [
	"Return true if I represent an identity transformation, false otherwise"
	<return: #Boolean>
	
	^ self matrix isIdentity
]

{ #category : #accessing }
TbElementAbsoluteTransformation >> matrix [
	^ matrix
]

{ #category : #accessing }
TbElementAbsoluteTransformation >> matrix: aBlMatrix [
	matrix := aBlMatrix
]
