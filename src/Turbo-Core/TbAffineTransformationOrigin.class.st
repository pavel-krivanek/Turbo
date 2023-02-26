"
I represent an origin of the affine transformation.
I can be very useful when users want to rotate / scale or shear an element about its center or one of the corners
"
Class {
	#name : #TbAffineTransformationOrigin,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : #'Turbo-Core-Basic-Transformations'
}

{ #category : #math }
TbAffineTransformationOrigin >> originIn: anElement [
	"Return a point describing an origin of a transformation within a given element.
	Origin can be either a 2D or 3D points and should be given in local coordinates of the element"
	<return: #Point or: #BlPoint3D>

	^ self subclassResponsibility
]
