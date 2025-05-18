Class {
	#name : 'TbTouchUpEvent',
	#superclass : 'TbTouchEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbTouchUpEvent >> sendTo: anObject [
	anObject touchUpEvent: self
]
