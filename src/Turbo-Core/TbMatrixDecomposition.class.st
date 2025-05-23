"
I represent a matrix decomposition in components.

For example in case of 2D matrix they are:
	- translation
	- scale
	- rotation angle
	- top left 2x2 minor of original matrix
	
3D (4x4) matrices are decomposed as follows:
	- translation
	- scale
	- skew
	- perspective
	- quaternion
"
Class {
	#name : 'TbMatrixDecomposition',
	#superclass : 'Object',
	#category : 'Turbo-Core-Basic-Math',
	#package : 'Turbo-Core',
	#tag : 'Basic-Math'
}

{ #category : 'converting' }
TbMatrixDecomposition >> asDictionary [
	<return: #Dictionary>

	^ self subclassResponsibility
]

{ #category : 'matrix - mathematical functions' }
TbMatrixDecomposition >> composition [
	"Compose and return a matrix for this decomposition"
	<return: #BlMatrix>
	
	^ self subclassResponsibility
]

{ #category : 'matrix - mathematical functions' }
TbMatrixDecomposition >> interpolate: aFactor to: anotherDecomposition [
	<return: #BlMatrixDecomposition>

	^ self subclassResponsibility
]
