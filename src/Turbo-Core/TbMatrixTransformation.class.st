"
I am an affine transformation that is directly defined by transformation matrix
"
Class {
	#name : #TbMatrixTransformation,
	#superclass : #TbAffineTransformation,
	#instVars : [
		'matrix'
	],
	#category : #'Turbo-Core-Basic-Transformations'
}

{ #category : #'instance creation' }
TbMatrixTransformation class >> matrix: aBlMatrix [
	^ self new matrix: aBlMatrix
]

{ #category : #initialization }
TbMatrixTransformation >> initialize [
	super initialize.
	
	matrix := TbMatrix2D new
]

{ #category : #testing }
TbMatrixTransformation >> is2D [
	^ self matrix is2D
]

{ #category : #accessing }
TbMatrixTransformation >> matrix [
	<return: #BlMatrix>

	^ matrix
]

{ #category : #accessing }
TbMatrixTransformation >> matrix: aBlMatrix [
	matrix := aBlMatrix
]

{ #category : #'mathematical functions' }
TbMatrixTransformation >> multiplyOn: aBlMatrix [
	aBlMatrix multiplyBy: self matrix
]
