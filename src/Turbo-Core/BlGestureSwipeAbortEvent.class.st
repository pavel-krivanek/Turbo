Class {
	#name : #BlGestureSwipeAbortEvent,
	#superclass : #BlGestureBaseSwipeEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlGestureSwipeAbortEvent >> sendTo: anObject [
	anObject gestureSwipeAbortEvent: self
]
