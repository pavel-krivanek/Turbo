Class {
	#name : #BlMouseStillDownEvent,
	#superclass : #BlMouseEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #testing }
BlMouseStillDownEvent >> isMouseDown [
	^ true
]

{ #category : #sending }
BlMouseStillDownEvent >> sendTo: anObject [
	anObject mouseStillDownEvent: self
]
