Class {
	#name : #BlBlurEvent,
	#superclass : #BlBaseFocusEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #testing }
BlBlurEvent >> isBlur [
	^ true
]

{ #category : #sending }
BlBlurEvent >> sendTo: anObject [
	anObject blurEvent: self
]
