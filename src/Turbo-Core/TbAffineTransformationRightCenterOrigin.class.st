"
I am a relative transformation origin which is attached to the right center of an element.
"
Class {
	#name : 'TbAffineTransformationRightCenterOrigin',
	#superclass : 'TbAffineTransformationOrigin',
	#category : 'Turbo-Core-Basic-Transformations',
	#package : 'Turbo-Core',
	#tag : 'Basic-Transformations'
}

{ #category : 'math' }
TbAffineTransformationRightCenterOrigin >> originIn: anElement [
	"@see Method comment BlAffineTransformationOrigin>>#originIn:"
	<return: #Point or: #BlPoint3D>

	^ anElement width @ (anElement height / 2.0)
]
