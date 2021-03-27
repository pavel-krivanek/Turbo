Class {
	#name : #TbBaseFocusEvent,
	#superclass : #TbEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #converting }
TbBaseFocusEvent >> asBlurEvent [
	^ BlBlurEvent new
		copyFrom: self;
		yourself
]

{ #category : #converting }
TbBaseFocusEvent >> asFocusInEvent [
	^ BlFocusInEvent new
		copyFrom: self;
		canBePropagated: false;
		yourself
]

{ #category : #converting }
TbBaseFocusEvent >> asFocusOutEvent [
	^ BlFocusOutEvent new
		copyFrom: self;
		canBePropagated: false;
		yourself
]

{ #category : #testing }
TbBaseFocusEvent >> isBaseFocus [
	^ true
]
