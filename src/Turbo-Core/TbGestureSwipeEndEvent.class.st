Class {
	#name : 'TbGestureSwipeEndEvent',
	#superclass : 'TbGestureBaseSwipeEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbGestureSwipeEndEvent >> sendTo: anObject [
	anObject gestureSwipeEndEvent: self
]
