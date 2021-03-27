Class {
	#name : #BlGestureRotationEndEvent,
	#superclass : #BlGestureBaseRotationEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlGestureRotationEndEvent >> sendTo: anObject [
	anObject gestureRotationEndEvent: self
]
