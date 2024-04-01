"
I am a composite transformation that consists of other element transformations, either absolute, local or composite
"
Class {
	#name : #TbElementCompositeTransformation,
	#superclass : #TbElementDynamicTransformation,
	#instVars : [
		'transformations'
	],
	#category : #'Turbo-Core-Basic-Transformations'
}

{ #category : #adding }
TbElementCompositeTransformation >> add: anElementTransformation [
	
	anElementTransformation owner: self owner.
	self transformations add: anElementTransformation
]

{ #category : #computation }
TbElementCompositeTransformation >> computeMatrix [	
	self transformations
		"when composing transformations we should perform left multiplication.
		since multiplyBy: is a right multiplication we should iterate in reversed order"
		reverseDo: [ :anElementTransformation | matrix multiplyBy: anElementTransformation matrix ]
]

{ #category : #initialization }
TbElementCompositeTransformation >> initialize [
	super initialize.
	
	transformations := OrderedCollection new
]

{ #category : #invalidation }
TbElementCompositeTransformation >> invalidateMatrix [
	"Matrix is computed out of affine transformation composition
	which may contain transformations that depend on element's properties
	such as extent. It means that when element changes we need to invalidate and
	recompute the matrix => set it to nil to trigger computation on next matrix access"

	matrix := nil.
	self transformations do: #invalidateMatrix
]

{ #category : #testing }
TbElementCompositeTransformation >> is2D [
	"Return true if my current transformation is in 2D space, false otherwise"
	<return: #Boolean>
	
	^ self transformations allSatisfy: #is2D
]

{ #category : #testing }
TbElementCompositeTransformation >> is3D [
	<return: #Boolean>
	
	^ self transformations anySatisfy: #is3D
]

{ #category : #testing }
TbElementCompositeTransformation >> isIdentity [
	"Return true if I represent an identity transformation, false otherwise"
	<return: #Boolean>
	
	^ self transformations allSatisfy: #isIdentity
]

{ #category : #accessing }
TbElementCompositeTransformation >> matrix [
	<return: #BlMatrix>

	self ensureMatrix.
	^ matrix
]

{ #category : #accessing }
TbElementCompositeTransformation >> owner: anElement [
	super owner: anElement.
	self transformations do: [ :aTransformation | aTransformation owner: anElement ]
]

{ #category : #accessing }
TbElementCompositeTransformation >> transformations [
	^ transformations
]
