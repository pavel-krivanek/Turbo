Class {
	#name : #TbMouseStillDownEvent,
	#superclass : #TbMouseEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #testing }
TbMouseStillDownEvent >> isMouseDown [
	^ true
]

{ #category : #sending }
TbMouseStillDownEvent >> sendTo: anObject [
	anObject mouseStillDownEvent: self
]
