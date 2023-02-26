Class {
	#name : #TbGestureRotationEndEvent,
	#superclass : #TbGestureBaseRotationEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbGestureRotationEndEvent >> sendTo: anObject [
	anObject gestureRotationEndEvent: self
]
