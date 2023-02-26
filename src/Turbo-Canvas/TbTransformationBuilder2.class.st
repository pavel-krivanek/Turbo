Class {
	#name : #TbTransformationBuilder2,
	#superclass : #TbAbstractBuilder,
	#traits : 'TTbSpartaTransformable',
	#classTraits : 'TTbSpartaTransformable classTrait',
	#instVars : [
		'transformation',
		'current'
	],
	#category : #'Turbo-Canvas'
}

{ #category : #'as yet unclassified' }
TbTransformationBuilder2 >> apply [
	
	transformation isIdentity
		ifTrue: [ ^ self ].

	"self primApplyTransform: (SpartaCairoMatrix fromSpartaMatrix: transformation)"
]

{ #category : #'as yet unclassified' }
TbTransformationBuilder2 >> by: aBlElementTransform translated: aPoint during: aBlock [

	| needsTransformation needsTranslation  |

	needsTranslation := aPoint isZero not.
	needsTransformation := aBlElementTransform isIdentity not.
	(needsTransformation or: [ needsTranslation ])
		ifFalse: [ ^ aBlock value: self canvas ].
	
	self during: [
		needsTranslation
			ifTrue: [ self translateBy: aPoint ].
			
		needsTransformation
			ifTrue: [ self multiplyBy: aBlElementTransform ].
			
		self apply.

		aBlock value: self canvas ]
]

{ #category : #'as yet unclassified' }
TbTransformationBuilder2 >> current [
	
	^ current
]

{ #category : #'as yet unclassified' }
TbTransformationBuilder2 >> during: aBlock [
	self push.
	[ aBlock cull: self ] ensure: [
		self pop ]
]

{ #category : #'as yet unclassified' }
TbTransformationBuilder2 >> initialize [

	super initialize.
	current := TbSpartaMatrix new.
]

{ #category : #'as yet unclassified' }
TbTransformationBuilder2 >> pop [
	canvas popTransform
	"self primSetTransform: (SpartaCairoMatrix fromSpartaMatrix: canvas popTransform)"
]

{ #category : #'as yet unclassified' }
TbTransformationBuilder2 >> push [

	canvas pushTransform: self transformation
]

{ #category : #'as yet unclassified' }
TbTransformationBuilder2 >> reset [
	super reset.
	transformation := TbSpartaMatrix new
]

{ #category : #'as yet unclassified' }
TbTransformationBuilder2 >> set: aMatrix [

	transformation := TbSpartaMatrix new loadAffineTransform: aMatrix
]

{ #category : #'as yet unclassified' }
TbTransformationBuilder2 >> transformation [
	^ transformation
]
