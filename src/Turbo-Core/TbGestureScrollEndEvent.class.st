Class {
	#name : 'TbGestureScrollEndEvent',
	#superclass : 'TbGestureBaseScrollEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbGestureScrollEndEvent >> sendTo: anObject [
	anObject gestureScrollEndEvent: self
]
