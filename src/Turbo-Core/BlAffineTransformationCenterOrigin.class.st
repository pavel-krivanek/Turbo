"
I am a relative transformation origin which is attached to the center of an element.
"
Class {
	#name : #BlAffineTransformationCenterOrigin,
	#superclass : #BlAffineTransformationOrigin,
	#category : #'Turbo-Core-Basic-Transformations'
}

{ #category : #math }
BlAffineTransformationCenterOrigin >> originIn: anElement [
	"@see Method comment BlAffineTransformationOrigin>>#originIn:"
	<return: #Point or: #BlPoint3D>

	^ anElement extent / 2.0
]
