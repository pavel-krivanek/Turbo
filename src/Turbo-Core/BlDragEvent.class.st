Class {
	#name : #BlDragEvent,
	#superclass : #BlBaseDragEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #testing }
BlDragEvent >> isDrag [
	^ true
]

{ #category : #sending }
BlDragEvent >> sendTo: anObject [
	anObject dragEvent: self
]
