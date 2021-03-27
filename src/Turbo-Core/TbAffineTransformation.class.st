"
In geometry, an affine transformation, affine map or an affinity (from the Latin, affinis, ""connected with"") is a function between affine spaces which preserves points, straight lines and planes. Also, sets of parallel lines remain parallel after an affine transformation. An affine transformation does not necessarily preserve angles between lines or distances between points, though it does preserve ratios of distances between points lying on a straight line.
Examples of affine transformations include translation, scaling, homothety, similarity transformation, reflection, rotation, shear mapping, and compositions of them in any combination and sequence.

https://en.wikipedia.org/wiki/Affine_transformation
"
Class {
	#name : #TbAffineTransformation,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'origin'
	],
	#category : #'Turbo-Core-Basic-Transformations'
}

{ #category : #converting }
TbAffineTransformation >> asMatrix [
	<return: #BlMatrix>
	| aMatrix |
	
	aMatrix := self is2D
		ifTrue: [ BlMatrix2D new ]
		ifFalse: [ BlMatrix3D new ].
		
	self multiplyOn: aMatrix.
	^ aMatrix
]

{ #category : #enumerating }
TbAffineTransformation >> do: aBlock [
	aBlock value: self
]

{ #category : #initialization }
TbAffineTransformation >> initialize [
	super initialize.
	
	origin := BlAffineTransformationCenterOrigin new
]

{ #category : #testing }
TbAffineTransformation >> is2D [
	"Return true if transformation happens in x-y plane, hence 2D"
	<return: #Boolean>
	
	^ self subclassResponsibility
]

{ #category : #testing }
TbAffineTransformation >> is3D [
	"Return true if transformation happens in x-y-z plane, hence 3D"
	<return: #Boolean>
	
	^ self is2D not
]

{ #category : #testing }
TbAffineTransformation >> isIdentity [
	"Return true if thiss transformation is identity"
	<return: #Boolean>
	
	^ false
]

{ #category : #'mathematical functions' }
TbAffineTransformation >> multiplyOn: aBlMatrix [
	self subclassResponsibility
]

{ #category : #'mathematical functions' }
TbAffineTransformation >> multiplyOn: aBlMatrix in: aBlElement [
	| anOriginPoint aVector |

	anOriginPoint := self origin originIn: aBlElement.
	aVector := anOriginPoint asBlocVector.
	
	aBlMatrix translateBy: aVector negated.
	self multiplyOn: aBlMatrix.
	aBlMatrix translateBy: aVector
]

{ #category : #accessing }
TbAffineTransformation >> origin [
	<return: #BlAffineTransformationOrigin>

	^ origin
]

{ #category : #accessing }
TbAffineTransformation >> origin: aBlAffineTransformationOrigin [
	origin := aBlAffineTransformationOrigin
]
