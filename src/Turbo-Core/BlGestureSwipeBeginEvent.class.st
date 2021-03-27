Class {
	#name : #BlGestureSwipeBeginEvent,
	#superclass : #BlGestureBaseSwipeEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlGestureSwipeBeginEvent >> sendTo: anObject [
	anObject gestureSwipeBeginEvent: self
]
