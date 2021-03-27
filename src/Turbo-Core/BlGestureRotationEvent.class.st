Class {
	#name : #BlGestureRotationEvent,
	#superclass : #BlGestureBaseRotationEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlGestureRotationEvent >> sendTo: anObject [
	anObject gestureRotationEvent: self
]
