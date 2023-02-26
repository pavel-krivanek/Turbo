Class {
	#name : #TbGestureScrollEndEvent,
	#superclass : #TbGestureBaseScrollEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbGestureScrollEndEvent >> sendTo: anObject [
	anObject gestureScrollEndEvent: self
]
