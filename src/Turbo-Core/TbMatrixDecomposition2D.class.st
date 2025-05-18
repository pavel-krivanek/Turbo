"
I am a decomposition of 2D matrix.

https://drafts.csswg.org/css-transforms/#interpolation-of-2d-matrices
"
Class {
	#name : 'TbMatrixDecomposition2D',
	#superclass : 'TbMatrixDecomposition',
	#instVars : [
		'translation',
		'scale',
		'angle',
		'matrix'
	],
	#category : 'Turbo-Core-Basic-Math',
	#package : 'Turbo-Core',
	#tag : 'Basic-Math'
}

{ #category : 'accessing' }
TbMatrixDecomposition2D >> angle [
	"Return a decomposed rotation angle in degrees"
	<return: #Number>

	^ angle
]

{ #category : 'accessing' }
TbMatrixDecomposition2D >> angle: aNumber [
	angle := aNumber
]

{ #category : 'converting' }
TbMatrixDecomposition2D >> asDictionary [
	<return: #Dictionary>
	^ { 
		'Translation' -> self translation.
		'Scale' -> self scale.
		'Rotation angle (degrees)' -> self angle.
		'Inner matrix' -> self matrix
	} asOrderedDictionary
]

{ #category : 'matrix - mathematical functions' }
TbMatrixDecomposition2D >> composition [
	<return: #BlMatrix2D>
	| composedMatrix |
	
	composedMatrix := TbMatrix2D new.
	composedMatrix sx: (matrix at: 1 at: 1).
	composedMatrix shy: (matrix at: 1 at: 2).
	composedMatrix shx: (matrix at: 2 at: 1).
	composedMatrix sy: (matrix at: 2 at: 2).
	
	"Translate matrix"
	composedMatrix x: (translation x * composedMatrix sx) + (translation y * composedMatrix shx).
	composedMatrix y: (translation x * composedMatrix shy) + (translation y * composedMatrix sy).
	
	"rotate matrix"
	composedMatrix := (TbMatrix2D rotation: angle degreesToRadians) multiplyBy: (composedMatrix).

	"Scale matrix."
	composedMatrix sx: composedMatrix sx * scale x.
	composedMatrix shy: composedMatrix shy * scale x.
	composedMatrix shx: composedMatrix shx * scale y.
	composedMatrix sy: composedMatrix sy * scale y.
	
	^ composedMatrix
]

{ #category : 'matrix - mathematical functions' }
TbMatrixDecomposition2D >> interpolate: aFactor to: anotherDecomposition [
	"Algorithm is based on https://drafts.csswg.org/css-transforms/#interpolation-of-decomposed-2d-matrix-values"
	<return: #BlMatrixDecomposition2D>
	| aScaleX aScaleY anAngle anOtherAngle aTranslation aScale aMatrix |
	
	aScaleX := self scale x.
	aScaleY := self scale y.
	anAngle := self angle.
	anOtherAngle := anotherDecomposition angle.

	((aScaleX < 0 and: [ anotherDecomposition scale y ])
		or: [ aScaleY < 0 and: [ anotherDecomposition scale x < 0 ] ])
			ifTrue: [
				aScaleX := aScaleX negated.
				aScaleY := aScaleY negated.
				anAngle < 0
					ifTrue: [ anAngle := anAngle + 180 ]
					ifFalse: [ anAngle := anAngle - 180 ] ].
	
	"Don't rotate the long way around."
	anAngle isZero
		ifTrue: [ anAngle := 360 ].
	anOtherAngle isZero
		ifTrue: [ anOtherAngle := 360 ].

	(anAngle - anOtherAngle) abs > 180
		ifTrue: [ 
			anAngle > anOtherAngle
				ifTrue: [ anAngle := anAngle - 360 ]
				ifFalse: [ anOtherAngle := anOtherAngle - 360 ] ].
	
	"Interpolate all values."
	aTranslation := self translation + ((anotherDecomposition translation - self translation) * aFactor).
	aScale := self scale + ((anotherDecomposition scale - (TbVector x: aScaleX y: aScaleY)) * aFactor).
	anAngle := anAngle + ((anOtherAngle - anAngle) * aFactor).
	aMatrix := self matrix
		with: anotherDecomposition matrix
		collect: [ :aComponent :anOtherComponent | aComponent + ((anOtherComponent - aComponent) * aFactor) ].
	
	^ self class new
		translation: aTranslation;
		scale: aScale;
		angle: anAngle;
		matrix: aMatrix
]

{ #category : 'accessing' }
TbMatrixDecomposition2D >> matrix [
	<return: #Matrix>

	^ matrix
]

{ #category : 'accessing' }
TbMatrixDecomposition2D >> matrix: aMatrix [
	matrix := aMatrix
]

{ #category : 'accessing' }
TbMatrixDecomposition2D >> scale [
	<return: #TbVector>

	^ scale
]

{ #category : 'accessing' }
TbMatrixDecomposition2D >> scale: aVector [
	scale := aVector
]

{ #category : 'accessing' }
TbMatrixDecomposition2D >> translation [
	<return: #TbVector>
	
	^ translation
]

{ #category : 'accessing' }
TbMatrixDecomposition2D >> translation: aVector [
	translation := aVector
]
