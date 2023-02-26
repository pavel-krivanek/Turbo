Class {
	#name : #TbBlurEvent,
	#superclass : #TbBaseFocusEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #testing }
TbBlurEvent >> isBlur [
	^ true
]

{ #category : #sending }
TbBlurEvent >> sendTo: anObject [
	anObject blurEvent: self
]
