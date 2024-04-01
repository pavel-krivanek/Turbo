Class {
	#name : #TbGestureSwipeEndEvent,
	#superclass : #TbGestureBaseSwipeEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbGestureSwipeEndEvent >> sendTo: anObject [
	anObject gestureSwipeEndEvent: self
]
