Class {
	#name : #BlGestureSwipeEndEvent,
	#superclass : #BlGestureBaseSwipeEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlGestureSwipeEndEvent >> sendTo: anObject [
	anObject gestureSwipeEndEvent: self
]
