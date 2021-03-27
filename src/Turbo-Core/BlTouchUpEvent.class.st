Class {
	#name : #BlTouchUpEvent,
	#superclass : #BlTouchEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlTouchUpEvent >> sendTo: anObject [
	anObject touchUpEvent: self
]
