Class {
	#name : 'TbBaseFocusEvent',
	#superclass : 'TbEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'converting' }
TbBaseFocusEvent >> asBlurEvent [
	^ TbBlurEvent new
		copyFrom: self;
		yourself
]

{ #category : 'converting' }
TbBaseFocusEvent >> asFocusInEvent [
	^ TbFocusInEvent new
		copyFrom: self;
		canBePropagated: false;
		yourself
]

{ #category : 'converting' }
TbBaseFocusEvent >> asFocusOutEvent [
	^ TbFocusOutEvent new
		copyFrom: self;
		canBePropagated: false;
		yourself
]

{ #category : 'testing' }
TbBaseFocusEvent >> isBaseFocus [
	^ true
]
