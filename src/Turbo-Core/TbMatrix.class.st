"
I represent a transformation Matrix and define common API of 2D and 3D matrices
"
Class {
	#name : 'TbMatrix',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : 'Turbo-Core-Basic-Math',
	#package : 'Turbo-Core',
	#tag : 'Basic-Math'
}

{ #category : 'comparing' }
TbMatrix >> = anObject [
	self subclassResponsibility
]

{ #category : 'converting' }
TbMatrix >> asMatrixCollection [
	<return: #Matrix>
	
	^ self subclassResponsibility
]

{ #category : 'matrix - mathematical functions' }
TbMatrix >> decomposition [
	"Return a decomposition of the matrix"
	<return: #BlMatrixDecomposition>
	
	^ self subclassResponsibility
]

{ #category : 'matrix - mathematical functions' }
TbMatrix >> determinant [
	"Compute and return my determinant"
	<return: #Number>
	
	^ self subclassResponsibility
]

{ #category : 'comparing' }
TbMatrix >> hash [
	^ self subclassResponsibility
]

{ #category : 'matrix - mathematical functions' }
TbMatrix >> interpolate: aFactor to: anotherMatrix [
	"Perform a matrix interpolation with a given factor"
	<return: #BlMatrix>
	
	^ (self decomposition
		interpolate: aFactor
		to: anotherMatrix decomposition) composition
]

{ #category : 'testing' }
TbMatrix >> is2D [
	"Return true if matrix is 2D, false otherwise"
	<return: #Boolean>
	
	^ self subclassResponsibility
]

{ #category : 'matrix - transformations' }
TbMatrix >> multiplyBy: aMatrix [
	"Perform a right multiplication by a given matrix"
	
	self subclassResponsibility
]

{ #category : 'matrix - transformations' }
TbMatrix >> perspective: aDepth [
	"Apply perspective by aDepth which should be positive"
	
	self subclassResponsibility
]

{ #category : 'matrix - transformations' }
TbMatrix >> reflectBy: aDiagonalVector [
	"Apply a reflection transformation given by a diagonal vector"
	
	self subclassResponsibility
]

{ #category : 'matrix - transformations' }
TbMatrix >> rotateBy: aNumber [
	"Apply a rotation transformation by a given amount of degrees around z-axis"
	
	self
		rotateByDegrees: aNumber
		around: TbVector zAxis
]

{ #category : 'matrix - transformations' }
TbMatrix >> rotateByDegrees: aNumber around: aBlVector [
	"Apply a rotation transformation by a given amount of degrees around a provided axis vector"
	
	self rotateByRadians: aNumber degreesToRadians around: aBlVector
]

{ #category : 'matrix - transformations' }
TbMatrix >> rotateByRadians: aNumber around: aBlVector [
	"Apply a rotation transformation by a given amount of radians around a provided axis vector"
	
	self subclassResponsibility
]

{ #category : 'matrix - transformations' }
TbMatrix >> scaleBy: aBlVector [
	"Apply a scaling defined by a given vector"
	
	self subclassResponsibility
]

{ #category : 'matrix - transforming points' }
TbMatrix >> transformBounds: aBlBounds [
	"In-place transform given BlBounds according to my transformation.
	(local to global transformation)"
	<return: #BlBounds>
	
	^ self subclassResponsibility
]

{ #category : 'matrix - transforming points' }
TbMatrix >> transformPoint2D: aPoint2D [
	"Transform a given 2D point (either a ==Point== or ==BlPoint2D==).
	In any case return BlPoint2D"
	<return: #BlPoint2D>

	^ self subclassResponsibility
]

{ #category : 'matrix - transforming points' }
TbMatrix >> transformPoint3D: aPoint3D [
	"Transform a given 3D point according to this transformation matrix"
	<return: #BlPoint3D>
	
	^ self subclassResponsibility
]

{ #category : 'matrix - transforming points' }
TbMatrix >> transformPoint4D: aPoint4D [
	"Transform a given 4D point according to this transformation matrix"
	<return: #BlPoint4D>
	
	^ self subclassResponsibility
]

{ #category : 'matrix - transforming points' }
TbMatrix >> transformPoint: aPoint [
	"Transform a given point according to transformation matrix.
	I perform a double dispatch to handle 2D/3D/4D points and 2D/3D matrices"
	<return: #BlPoint>

	^ aPoint transformedOn: self
]

{ #category : 'matrix - transformations' }
TbMatrix >> translateBy: aBlVector [
	"Apply a translation by a given vector"
	
	self subclassResponsibility
]
