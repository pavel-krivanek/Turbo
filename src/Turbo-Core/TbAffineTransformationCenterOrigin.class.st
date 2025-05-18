"
I am a relative transformation origin which is attached to the center of an element.
"
Class {
	#name : 'TbAffineTransformationCenterOrigin',
	#superclass : 'TbAffineTransformationOrigin',
	#category : 'Turbo-Core-Basic-Transformations',
	#package : 'Turbo-Core',
	#tag : 'Basic-Transformations'
}

{ #category : 'math' }
TbAffineTransformationCenterOrigin >> originIn: anElement [
	"@see Method comment BlAffineTransformationOrigin>>#originIn:"
	<return: #Point or: #BlPoint3D>

	^ anElement extent / 2.0
]
