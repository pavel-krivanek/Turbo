Class {
	#name : #BlTouchMoveEvent,
	#superclass : #BlTouchEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlTouchMoveEvent >> sendTo: anObject [
	anObject touchMoveEvent: self
]
