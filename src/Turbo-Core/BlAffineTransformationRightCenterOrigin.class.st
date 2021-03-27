"
I am a relative transformation origin which is attached to the right center of an element.
"
Class {
	#name : #BlAffineTransformationRightCenterOrigin,
	#superclass : #BlAffineTransformationOrigin,
	#category : #'Turbo-Core-Basic-Transformations'
}

{ #category : #math }
BlAffineTransformationRightCenterOrigin >> originIn: anElement [
	"@see Method comment BlAffineTransformationOrigin>>#originIn:"
	<return: #Point or: #BlPoint3D>

	^ anElement width @ (anElement height / 2.0)
]
