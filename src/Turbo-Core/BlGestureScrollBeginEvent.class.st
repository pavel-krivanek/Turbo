Class {
	#name : #BlGestureScrollBeginEvent,
	#superclass : #BlGestureBaseScrollEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlGestureScrollBeginEvent >> sendTo: anObject [
	anObject gestureScrollBeginEvent: self
]
