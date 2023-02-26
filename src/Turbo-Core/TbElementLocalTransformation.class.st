"
I represent a local element's transformation defined by a composition of affine transformations.

Transformation matrix is computed lazily up-on request for #matrix.
"
Class {
	#name : #TbElementLocalTransformation,
	#superclass : #TbElementDynamicTransformation,
	#instVars : [
		'transformation'
	],
	#category : #'Turbo-Core-Basic-Transformations'
}

{ #category : #'instance creation' }
TbElementLocalTransformation class >> with: anAfineTransformation [
	^ self basicNew
		initializeWith: anAfineTransformation
]

{ #category : #computation }
TbElementLocalTransformation >> computeMatrix [
	transformation multiplyOn: matrix in: owner
]

{ #category : #initialization }
TbElementLocalTransformation >> initialize [
	super initialize.
	
	transformation := TbAffineCompositeTransformation new
]

{ #category : #initialization }
TbElementLocalTransformation >> initializeWith: aTransformation [
	super initialize.

	transformation := aTransformation
]

{ #category : #invalidation }
TbElementLocalTransformation >> invalidateMatrix [
	"Matrix is computed out of affine transformation composition
	which may contain transformations that depend on element's properties
	such as extent. It means that when element changes we need to invalidate and
	recompute the matrix => set it to nil to trigger computation on next matrix access"

	matrix := nil
]

{ #category : #testing }
TbElementLocalTransformation >> is2D [
	"Return true if my current transformation is in 2D space, false otherwise"
	<return: #Boolean>

	^ self transformation is2D
]

{ #category : #testing }
TbElementLocalTransformation >> is3D [
	"Return true if my current transformation is in 3D space, false otherwise"
	<return: #Boolean>

	^ self transformation is3D
]

{ #category : #testing }
TbElementLocalTransformation >> isIdentity [
	"Return true if I represent an identity transformation, false otherwise"
	<return: #Boolean>
	
	^ self transformation isIdentity
]

{ #category : #copying }
TbElementLocalTransformation >> postCopy [
	super postCopy.

	transformation := transformation copy
]

{ #category : #accessing }
TbElementLocalTransformation >> transformation [
	<return: #BlAffineCompositeTransformation>

	^ transformation
]
