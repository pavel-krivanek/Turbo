Class {
	#name : #TbGestureSwipeBeginEvent,
	#superclass : #TbGestureBaseSwipeEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbGestureSwipeBeginEvent >> sendTo: anObject [
	anObject gestureSwipeBeginEvent: self
]
