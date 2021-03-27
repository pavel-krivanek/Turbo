Class {
	#name : #TbGestureScrollBeginEvent,
	#superclass : #TbGestureBaseScrollEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbGestureScrollBeginEvent >> sendTo: anObject [
	anObject gestureScrollBeginEvent: self
]
