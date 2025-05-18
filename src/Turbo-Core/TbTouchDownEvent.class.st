Class {
	#name : 'TbTouchDownEvent',
	#superclass : 'TbTouchEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbTouchDownEvent >> sendTo: anObject [
	anObject touchDownEvent: self
]
