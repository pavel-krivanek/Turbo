Class {
	#name : 'TbGestureScrollBeginEvent',
	#superclass : 'TbGestureBaseScrollEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbGestureScrollBeginEvent >> sendTo: anObject [
	anObject gestureScrollBeginEvent: self
]
