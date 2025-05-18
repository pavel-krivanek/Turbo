"
I a transformation builder and allow users to create and modify complex transformation chains.

Example of a builder that appends new transformations to existing ones:

element transform
	inherit;
	origin: (BlAffineTransformationPositionOrigin position: 0@0);
	translateBy: (BlVector x: 100 y: 100 z: 0);
	scaleBy: (BlVector x: 2 y: 0.5 z: 1);
	apply
"
Class {
	#name : 'TbTransformationBuilder',
	#superclass : 'Object',
	#instVars : [
		'transformation',
		'origin',
		'target'
	],
	#category : 'Turbo-Core-Basic-Transformations',
	#package : 'Turbo-Core',
	#tag : 'Basic-Transformations'
}

{ #category : 'instance creation' }
TbTransformationBuilder class >> on: anObject [
	<return: #BlTransformationBuilder>

	^ self new target: anObject
]

{ #category : 'transformations' }
TbTransformationBuilder >> apply [
	"Replace element's transformation chain with our new one that we just have built"
	| anElementTransformation |

	anElementTransformation := TbElementLocalTransformation with: transformation.
	target transformation: anElementTransformation
]

{ #category : 'accessing' }
TbTransformationBuilder >> element [
	self 
		deprecated: 'Use target instead'
		on: 	'5 November 2017' 
		in: 'Pharo-7.0+alpha.build.171.sha.df95d5fd8faa4c6bfd3537e26d67bb2c37daf99f (32 Bit)'.
	^ self target
]

{ #category : 'accessing' }
TbTransformationBuilder >> element: anObject [ 
	self 
		deprecated: 'Use target: instead'
		on: 	'5 November 2017' 
		in: 'Pharo-7.0+alpha.build.171.sha.df95d5fd8faa4c6bfd3537e26d67bb2c37daf99f (32 Bit)'.
	^ self target: anObject
]

{ #category : 'transformations' }
TbTransformationBuilder >> flipX [
	transformation addTransformation: (TbReflectionTransformation vertical origin: origin)
]

{ #category : 'transformations' }
TbTransformationBuilder >> flipY [
	transformation addTransformation: (TbReflectionTransformation horizontal origin: origin)
]

{ #category : 'transformations' }
TbTransformationBuilder >> inherit [
	"Append existing element's transformations to the new transformation list"
	
	target transformation transformation
		do: [ :aTransformation | transformation addTransformation: aTransformation ]
]

{ #category : 'initialization' }
TbTransformationBuilder >> initialize [
	super initialize.
	
	transformation := TbAffineCompositeTransformation new.
	origin := TbAffineTransformationCenterOrigin new
]

{ #category : 'transformations' }
TbTransformationBuilder >> matrix: aMatrix [
	"Note: matrix transformation is not influenced by origin (it is always top left corner or 0@0)"
	transformation addTransformation: ((TbMatrixTransformation matrix: aMatrix) origin: TbAffineTransformationTopLeftOrigin new)
]

{ #category : 'transformations' }
TbTransformationBuilder >> origin: anAffineTransformationOrigin [
	"Change transformation origin for all future transformations.
	Note: I do not change origins of already exisiting transformations"

	origin := anAffineTransformationOrigin
]

{ #category : 'transformations' }
TbTransformationBuilder >> rotateBy: aDegreesAngle [
	transformation addTransformation: (TbRotationTransformation new angle: aDegreesAngle; axis: TbVector zAxis; origin: origin)
]

{ #category : 'transformations' }
TbTransformationBuilder >> rotateBy: aDegreesAngle around: aVector [
	transformation addTransformation: (TbRotationTransformation new angle: aDegreesAngle; axis: aVector; origin: origin)
]

{ #category : 'transformations' }
TbTransformationBuilder >> scaleBy: aVector [
	"Append a scaling transformation by a given vector"

	transformation addTransformation: ((TbScalingTransformation scale: aVector asScale3D) origin: origin)
]

{ #category : 'transformations' }
TbTransformationBuilder >> scaleTo: aVector [
	"Replace all existing scaling transformation with a single one
	that takes place of the very first scaling transformation.
	For example, existing transformation list (L1)
		- translate
		- scale X1
		- rotate
		- scale X2
	will be transformed into the following:
		- translate
		- scale Y
		- rotate
	note, how two existing scaling transformation got merged into one"
	
	
]

{ #category : 'accessing' }
TbTransformationBuilder >> target [
	"Return a target object whose transformation we build"
	<return: #Object>

	^ target
]

{ #category : 'accessing' }
TbTransformationBuilder >> target: anObject [
	target := anObject
]

{ #category : 'transformations' }
TbTransformationBuilder >> translateBy: aVector [
	"Append a translation transformation by a given vector"
	
	transformation addTransformation: ((TbTranslationTransformation translation: aVector asTranslate3D) origin: origin)
]
