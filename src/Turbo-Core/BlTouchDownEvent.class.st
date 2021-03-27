Class {
	#name : #BlTouchDownEvent,
	#superclass : #BlTouchEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlTouchDownEvent >> sendTo: anObject [
	anObject touchDownEvent: self
]
