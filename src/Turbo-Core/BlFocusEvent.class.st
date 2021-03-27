Class {
	#name : #BlFocusEvent,
	#superclass : #BlBaseFocusEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #testing }
BlFocusEvent >> isFocus [
	^ true
]

{ #category : #sending }
BlFocusEvent >> sendTo: anObject [
	anObject focusEvent: self
]
