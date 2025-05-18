Class {
	#name : 'TbGestureSwipeEvent',
	#superclass : 'TbGestureBaseSwipeEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbGestureSwipeEvent >> sendTo: anObject [
	anObject gestureSwipeEvent: self
]
