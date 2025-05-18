Class {
	#name : 'TbGestureSwipeBeginEvent',
	#superclass : 'TbGestureBaseSwipeEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbGestureSwipeBeginEvent >> sendTo: anObject [
	anObject gestureSwipeBeginEvent: self
]
