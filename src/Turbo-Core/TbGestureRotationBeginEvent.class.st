Class {
	#name : #TbGestureRotationBeginEvent,
	#superclass : #TbGestureBaseRotationEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbGestureRotationBeginEvent >> sendTo: anObject [
	anObject gestureRotationBeginEvent: self
]
