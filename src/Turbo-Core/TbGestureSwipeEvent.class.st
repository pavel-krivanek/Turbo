Class {
	#name : #TbGestureSwipeEvent,
	#superclass : #TbGestureBaseSwipeEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbGestureSwipeEvent >> sendTo: anObject [
	anObject gestureSwipeEvent: self
]
