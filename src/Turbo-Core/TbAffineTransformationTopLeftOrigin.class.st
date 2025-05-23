"
I am a relative transformation origin which is attached to the top left of an element.
"
Class {
	#name : 'TbAffineTransformationTopLeftOrigin',
	#superclass : 'TbAffineTransformationOrigin',
	#category : 'Turbo-Core-Basic-Transformations',
	#package : 'Turbo-Core',
	#tag : 'Basic-Transformations'
}

{ #category : 'math' }
TbAffineTransformationTopLeftOrigin >> originIn: anElement [
	"@see Method comment BlAffineTransformationOrigin>>#originIn:"
	<return: #Point or: #BlPoint3D>

	^ 0 @ 0
]
