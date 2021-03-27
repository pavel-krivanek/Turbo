Class {
	#name : #TbFocusEvent,
	#superclass : #TbBaseFocusEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #testing }
TbFocusEvent >> isFocus [
	^ true
]

{ #category : #sending }
TbFocusEvent >> sendTo: anObject [
	anObject focusEvent: self
]
