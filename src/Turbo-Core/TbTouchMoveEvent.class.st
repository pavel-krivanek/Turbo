Class {
	#name : 'TbTouchMoveEvent',
	#superclass : 'TbTouchEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbTouchMoveEvent >> sendTo: anObject [
	anObject touchMoveEvent: self
]
