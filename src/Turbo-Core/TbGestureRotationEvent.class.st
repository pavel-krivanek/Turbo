Class {
	#name : #TbGestureRotationEvent,
	#superclass : #TbGestureBaseRotationEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbGestureRotationEvent >> sendTo: anObject [
	anObject gestureRotationEvent: self
]
