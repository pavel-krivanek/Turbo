"
I am a scale strategy used to determine a neccessary scale factor of a content element within scalable element.

Concrete implementations should override #scale:within: and return a number that represents a scale factor along both x and y axes.
"
Class {
	#name : 'TbScalableStrategy',
	#superclass : 'Object',
	#category : 'Turbo-Core-Utilities - Scalable',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Scalable'
}

{ #category : 'testing' }
TbScalableStrategy >> isFixed [
	<return: #Boolean>

	^ false
]

{ #category : 'scale' }
TbScalableStrategy >> scale: aContentElement within: aScalableElement [
	"Compute and return a scale factor of a content element within scalable element.
	Note: I am used during measurement pass, so you must only rely on measured bounds!"
	<return: #Number>
	
	^ self subclassResponsibility
]
