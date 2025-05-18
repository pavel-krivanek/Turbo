Class {
	#name : 'TbFocusEvent',
	#superclass : 'TbBaseFocusEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'testing' }
TbFocusEvent >> isFocus [
	^ true
]

{ #category : 'sending' }
TbFocusEvent >> sendTo: anObject [
	anObject focusEvent: self
]
