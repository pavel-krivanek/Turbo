Class {
	#name : #TbGestureSwipeAbortEvent,
	#superclass : #TbGestureBaseSwipeEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbGestureSwipeAbortEvent >> sendTo: anObject [
	anObject gestureSwipeAbortEvent: self
]
