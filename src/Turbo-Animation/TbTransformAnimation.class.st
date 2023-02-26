"
I am special type of animation designed to operate on element's transformation.

Transform animation can be absolute or relative.
(consistent with absolute/relative vector path builder)
 - #relative builds on existing element transformation
 - #absolute defines new element independent transformation
"
Class {
	#name : #TbTransformAnimation,
	#superclass : #TbAnimation,
	#traits : 'TTbTransformable',
	#classTraits : 'TTbTransformable classTrait',
	#instVars : [
		'transformation',
		'fromMatrix',
		'toMatrix',
		'isAbsolute'
	],
	#category : #'Turbo-Animation-Animation'
}

{ #category : #'instance creation' }
TbTransformAnimation class >> rotate: anAngleInDegrees [
	"Create a rotation transformation by a given angle in degrees"
	<return: #BlTransformAnimation>
	
	^ self new
		transformDo: [ :aBuilder | aBuilder rotateBy: anAngleInDegrees ];
		yourself
]

{ #category : #'instance creation' }
TbTransformAnimation class >> scale: aVector [
	"Create a scaling transformation by a given factor defined by a vector"
	<return: #BlTransformAnimation>
	
	^ self new
		transformDo: [ :aBuilder | aBuilder scaleBy: aVector ];
		yourself
]

{ #category : #'instance creation' }
TbTransformAnimation class >> translate: aVector [
	"Create a translation transformation by a given vector"
	<return: #BlTransformAnimation>
	
	^ self new
		transformDo: [ :aBuilder | aBuilder translateBy: aVector ];
		yourself
]

{ #category : #builder }
TbTransformAnimation >> absolute [
	isAbsolute := true
]

{ #category : #pulse }
TbTransformAnimation >> applyValue: anElementTransformation [
	self target transformation: anElementTransformation
]

{ #category : #pulse }
TbTransformAnimation >> initStart [
	super initStart.

	isAbsolute
		ifFalse: [
			| aCompositeTransformation |
			aCompositeTransformation := TbElementCompositeTransformation new.
			aCompositeTransformation add: self target transformation.
			aCompositeTransformation add: transformation.
			transformation := aCompositeTransformation ].
	
	transformation owner: self target.
	
	"matrix depends on computed layout bounds, we should manually trigger layout recomputation"
	self target space isLayoutRequested
		ifTrue: [ self target space doLayout ].

	fromMatrix := self target transformation matrix.
	toMatrix := transformation matrix
]

{ #category : #initialization }
TbTransformAnimation >> initialize [
	super initialize.
	
	isAbsolute := false.
	transformation := TbElementLocalTransformation new
]

{ #category : #builder }
TbTransformAnimation >> relative [
	isAbsolute := false
]

{ #category : #transformations }
TbTransformAnimation >> transformation [
	<return: #BlElementTransformation>

	^ transformation
]

{ #category : #transformations }
TbTransformAnimation >> transformation: anElementTransformation [
	transformation := anElementTransformation
]

{ #category : #pulse }
TbTransformAnimation >> valueForStep: aDelta [
	
	"we should recompute destination matrix every step because transformation origins may have changed"
	toMatrix := transformation invalidateMatrix matrix.
	^ TbElementAbsoluteTransformation matrix: (fromMatrix interpolate: aDelta to: toMatrix)
]
