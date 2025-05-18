Class {
	#name : 'TbGestureSwipeAbortEvent',
	#superclass : 'TbGestureBaseSwipeEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbGestureSwipeAbortEvent >> sendTo: anObject [
	anObject gestureSwipeAbortEvent: self
]
