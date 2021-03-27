Class {
	#name : #BlGestureRotationBeginEvent,
	#superclass : #BlGestureBaseRotationEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlGestureRotationBeginEvent >> sendTo: anObject [
	anObject gestureRotationBeginEvent: self
]
