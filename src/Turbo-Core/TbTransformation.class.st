"
I represent an element transformation and support both 2D and 3D transformations.

For optimization purposes I use 2D matrix if 3D transformation was not requested. As soon as I'm transformed in 3D all further transformation will also happen with the help of 3D matrix.
"
Class {
	#name : 'TbTransformation',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'matrix2D',
		'matrix3D'
	],
	#category : 'Turbo-Core-Basic-Transformations',
	#package : 'Turbo-Core',
	#tag : 'Basic-Transformations'
}

{ #category : 'initialization' }
TbTransformation >> defaultMatrix2D [
	^ TbMatrix2D new
]

{ #category : 'initialization' }
TbTransformation >> defaultMatrix3D [
	^ TbMatrix3D new
]

{ #category : 'private' }
TbTransformation >> ensure2D [
	"I make sure that matrix2D is initialized and ready to be used.
	Note: matrix3D must not exists when using me!"
	
	self
		assert: [ self is3D not ]
		description: [ 'I can not downgrade from 3D transformation to 2D!' ].
		
	matrix2D ifNil: [ matrix2D := self defaultMatrix2D ]
]

{ #category : 'private' }
TbTransformation >> ensure3D [
	"I make sure that matrix3D is initialized and ready to be used.
	Note: if I only have a 2D matrix I first convert it to 3D and then delete"
	
	matrix3D
		ifNotNil: [ ^ self ].
	
	matrix3D := matrix2D
		ifNotNil: [ self shouldBeImplemented ]
		ifNil: [ self defaultMatrix3D ]
]

{ #category : 'private' }
TbTransformation >> hasMatrix [
	"Return true if any of 2D or 3D matrices exist, false otherwise.
	Note: I am useful for fast exits"
	<return: #Boolean>
	
	^ matrix2D isNotNil or: [ matrix3D isNotNil ]
]

{ #category : 'initialization' }
TbTransformation >> initialize [
	super initialize.
	
	"we initialize lazily"	
	self loadIdentity
]

{ #category : 'transformation' }
TbTransformation >> inverseTransformBounds: aBounds [
	"In-place transform given BlBounds according to my transformation.
	(global to local transformation)"
	<return: #BlBounds>

	self hasMatrix
		ifFalse: [ ^ aBounds ].

	self is2D
		ifTrue: [ 
			self ensure2D.
			matrix2D inverted transformBounds: aBounds ]
		ifFalse: [ 
			self ensure3D.
			matrix3D inverted transformBounds: aBounds ].
		
	^ aBounds
]

{ #category : 'transformation' }
TbTransformation >> inverseTransformPoint: aPoint [
	"Apply an inversed transformation on a given point and return a result.
	Note: Throws BlSingularMatrixError if underlying matrix is singular"
	<return: #Point>
	
	aPoint isPoint
		ifFalse: [ self error: 'Only points can be transformed!' ].

	self hasMatrix
		ifNil: [ ^ aPoint ].
	
	^ (self is2D and: [ aPoint isPoint2D ])
		ifTrue: [ 
			self ensure2D.
			matrix2D inverted transformPoint: aPoint ]
		ifFalse: [ self shouldBeImplemented ]
]

{ #category : 'transformation' }
TbTransformation >> invert [
	self hasMatrix
		ifFalse: [ ^ self ].
		
	self is2D
		ifTrue: [ 
			self ensure2D.
			matrix2D := matrix2D inverted ]
		ifFalse: [ 
			self ensure3D.
			matrix3D := matrix3D inverted ]
]

{ #category : 'transformation' }
TbTransformation >> inverted [
	^ self copy invert
]

{ #category : 'testing' }
TbTransformation >> is2D [
	"Return true if my current transformation is in 2D space, false otherwise"
	<return: #Boolean>

	^ matrix3D isNil
]

{ #category : 'testing' }
TbTransformation >> is3D [
	"Return true if my current transformation is in 3D space, false otherwise"
	<return: #Boolean>

	^ matrix3D isNotNil
]

{ #category : 'testing' }
TbTransformation >> isIdentity [
	"Return true if I represent an identity transformation, false otherwise"
	<return: #Boolean>

	self hasMatrix
		ifFalse: [ ^ true ].
	
	^ self is2D
		ifTrue: [ 
			self ensure2D.
			matrix2D isIdentity ]
		ifFalse: [ 
			self shouldBeImplemented ]
]

{ #category : 'testing' }
TbTransformation >> isPureTranslation [
	"Return true if the receiver specifies no rotation or scaling and represents only translation in xy 2D plane"
	<return: #Boolean>
	
	self hasMatrix
		ifFalse: [ ^ true ].
	
	^ self is2D
		ifTrue: [ 
			self ensure2D.
			matrix2D isPureTranslation ]
		ifFalse: [ 
			self shouldBeImplemented ]
]

{ #category : 'initialization' }
TbTransformation >> loadIdentity [
	matrix2D := nil.
	matrix3D := nil
]

{ #category : 'copying' }
TbTransformation >> postCopy [
	matrix2D := matrix2D copy.
	matrix3D := matrix3D copy
]

{ #category : 'scaling' }
TbTransformation >> scaleBy: aFactor [
	"Apply a scaling by the given factor.
	Note: aDelta may be a Point, a BlPoint3D, aNumber or a BlockClosure that returns
	one of the supported types.
	In case of unknown type I thrown an Error.
	Q: why not to dispatch? A: it would pollute a Kernel with extention methods... we already added isPoint2D and isPoint3D..."

	aFactor isPoint
		ifTrue: [ aFactor isPoint2D
			ifTrue: [ self scaleX: aFactor x Y: aFactor y Z: 1.0 ]
			ifFalse: [ aFactor isPoint3D
				ifTrue: [ self scaleX: aFactor x Y: aFactor y Z: aFactor z ]
				ifFalse: [ self error: 'Unsupported Point type: ', aFactor asString ] ] ]

		"exotic cases when factor is not a point"
		ifFalse: [ aFactor isNumber
			ifTrue: [ self scaleX: aFactor Y: aFactor Z: aFactor ]
			ifFalse: [ aFactor isBlock 
				ifTrue: [ self scaleBy: aFactor value ]
				ifFalse: [ self error: 'Unsupported delta type: ', aFactor asString ] ] ]
]

{ #category : 'scaling' }
TbTransformation >> scaleTo: aPoint [
	"Define the scale factor using the given point.
	Note: aPoint may be a Point, a BlPoint3D or a BlockClosure that returns 
	one of the supported types."
]

{ #category : 'scaling' }
TbTransformation >> scaleX: aX [
	
	self scaleX: aX Y: 1.0 Z: 1.0
]

{ #category : 'scaling' }
TbTransformation >> scaleX: aX Y: aY [

	self scaleX: aX Y: aY Z: 1.0
]

{ #category : 'scaling' }
TbTransformation >> scaleX: aX Y: aY Z: aZ [
]

{ #category : 'scaling' }
TbTransformation >> scaleY: aY [

	self scaleX: 1.0 Y: aY Z: 1.0
]

{ #category : 'scaling' }
TbTransformation >> scaleZ: aZ [

	self scaleX: 1.0 Y: 1.0 Z: aZ
]

{ #category : 'transformation' }
TbTransformation >> transformBounds: aBounds [
	"In-place transform given BlBounds according to my transformation.
	(local to global transformation)"
	<return: #BlBounds>

	self hasMatrix
		ifFalse: [ ^ aBounds ].

	self is2D
		ifTrue: [ 
			self ensure2D.
			matrix2D transformBounds: aBounds ]
		ifFalse: [ 
			self ensure3D.
			matrix3D transformBounds: aBounds ].
		
	^ aBounds
]

{ #category : 'transformation' }
TbTransformation >> transformPoint: aPoint [
	"Transform given 2D point according to my transformation and return a transformed result point.
	(local to global transformation)"
	<return: #Point>

	self hasMatrix
		ifFalse: [ ^ aPoint ].

	^ self is2D
		ifTrue: [ 
			self ensure2D.
			matrix2D transformPoint: aPoint ]
		ifFalse: [ 
			self ensure3D.
			matrix3D transformPoint: aPoint ]
]

{ #category : 'translation' }
TbTransformation >> translateBy: aDelta [
	"Apply a translation by the given delta.
	Note: aDelta may be a Point, a BlPoint3D, aNumber or a BlockClosure that returns
	one of the supported types.
	In case of unknown type I thrown an Error.
	Q: why not to dispatch? A: it would pollute a Kernel with extention methods... we already added isPoint2D and isPoint3D..."

	aDelta isPoint
		ifTrue: [ aDelta isPoint2D
			ifTrue: [ self translateX: aDelta x Y: aDelta y Z: 0.0 ]
			ifFalse: [ aDelta isPoint3D
				ifTrue: [ self translateX: aDelta x Y: aDelta y Z: aDelta z ]
				ifFalse: [ self error: 'Unsupported Point type: ', aDelta asString ] ] ]
		ifFalse: [ aDelta isNumber
			ifTrue: [ self translateX: aDelta Y: aDelta Z: aDelta ]
			ifFalse: [ aDelta isBlock 
				ifTrue: [ self translateBy: aDelta value ]
				ifFalse: [ self error: 'Unsupported delta type: ', aDelta asString ] ] ]
]

{ #category : 'translation' }
TbTransformation >> translateTo: aPoint [
]

{ #category : 'translation' }
TbTransformation >> translateX: aX [
	
	self translateX: aX Y: 0.0 Z: 0.0
]

{ #category : 'translation' }
TbTransformation >> translateX: aX Y: aY [

	self translateX: aX Y: aY Z: 0.0
]

{ #category : 'translation' }
TbTransformation >> translateX: aX Y: aY Z: aZ [
]

{ #category : 'translation' }
TbTransformation >> translateY: aY [

	self translateX: 0.0 Y: aY Z: 0.0
]

{ #category : 'translation' }
TbTransformation >> translateZ: aZ [

	self translateX: 0.0 Y: 0.0 Z: aZ
]
