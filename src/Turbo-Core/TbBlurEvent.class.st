Class {
	#name : 'TbBlurEvent',
	#superclass : 'TbBaseFocusEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'testing' }
TbBlurEvent >> isBlur [
	^ true
]

{ #category : 'sending' }
TbBlurEvent >> sendTo: anObject [
	anObject blurEvent: self
]
