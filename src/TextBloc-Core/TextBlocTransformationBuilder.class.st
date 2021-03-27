Class {
	#name : #TextBlocTransformationBuilder,
	#superclass : #TextBlocAbstractBuilder,
	#traits : 'TSpartaTransformable',
	#classTraits : 'TSpartaTransformable classTrait',
	#instVars : [
		'transformation',
		'current'
	],
	#category : #'TextBloc-Core'
}

{ #category : #'as yet unclassified' }
TextBlocTransformationBuilder >> apply [
	
	transformation isIdentity
		ifTrue: [ ^ self ].

	"self primApplyTransform: (SpartaCairoMatrix fromSpartaMatrix: transformation)"
]

{ #category : #'as yet unclassified' }
TextBlocTransformationBuilder >> by: aBlElementTransform translated: aPoint during: aBlock [

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
TextBlocTransformationBuilder >> current [
	
	^ current
]

{ #category : #'as yet unclassified' }
TextBlocTransformationBuilder >> during: aBlock [
	self push.
	[ aBlock cull: self ] ensure: [
		self pop ]
]

{ #category : #'as yet unclassified' }
TextBlocTransformationBuilder >> initialize [

	super initialize.
	current := SpartaMatrix new.
]

{ #category : #'as yet unclassified' }
TextBlocTransformationBuilder >> pop [
	canvas popTransform
	"self primSetTransform: (SpartaCairoMatrix fromSpartaMatrix: canvas popTransform)"
]

{ #category : #'as yet unclassified' }
TextBlocTransformationBuilder >> push [

	canvas pushTransform: self transformation
]

{ #category : #'as yet unclassified' }
TextBlocTransformationBuilder >> reset [
	super reset.
	transformation := SpartaMatrix new
]

{ #category : #'as yet unclassified' }
TextBlocTransformationBuilder >> set: aMatrix [

	transformation := SpartaMatrix new loadAffineTransform: aMatrix
]

{ #category : #'as yet unclassified' }
TextBlocTransformationBuilder >> transformation [
	^ transformation
]
