"
I am a relative transformation origin which is attached to the left center of an element.
"
Class {
	#name : #TbAffineTransformationLeftCenterOrigin,
	#superclass : #TbAffineTransformationOrigin,
	#category : #'Turbo-Core-Basic-Transformations'
}

{ #category : #math }
TbAffineTransformationLeftCenterOrigin >> originIn: anElement [
	"@see Method comment BlAffineTransformationOrigin>>#originIn:"
	<return: #Point or: #BlPoint3D>

	^ 0 @ (anElement height / 2.0)
]
