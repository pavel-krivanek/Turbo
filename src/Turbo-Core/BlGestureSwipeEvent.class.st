Class {
	#name : #BlGestureSwipeEvent,
	#superclass : #BlGestureBaseSwipeEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlGestureSwipeEvent >> sendTo: anObject [
	anObject gestureSwipeEvent: self
]
