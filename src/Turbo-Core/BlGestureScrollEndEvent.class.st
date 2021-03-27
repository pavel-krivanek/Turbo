Class {
	#name : #BlGestureScrollEndEvent,
	#superclass : #BlGestureBaseScrollEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlGestureScrollEndEvent >> sendTo: anObject [
	anObject gestureScrollEndEvent: self
]
