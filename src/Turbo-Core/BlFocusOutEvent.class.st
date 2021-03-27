Class {
	#name : #BlFocusOutEvent,
	#superclass : #BlBaseFocusEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #testing }
BlFocusOutEvent >> isFocusOut [
	^ true
]

{ #category : #sending }
BlFocusOutEvent >> sendTo: anObject [
	anObject focusOutEvent: self
]
