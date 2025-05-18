Class {
	#name : 'TbFocusOutEvent',
	#superclass : 'TbBaseFocusEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'testing' }
TbFocusOutEvent >> isFocusOut [
	^ true
]

{ #category : 'sending' }
TbFocusOutEvent >> sendTo: anObject [
	anObject focusOutEvent: self
]
