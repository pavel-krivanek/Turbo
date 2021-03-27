Class {
	#name : #BlDragEnterEvent,
	#superclass : #BlBaseDragEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlDragEnterEvent >> sendTo: anObject [
	anObject dragEnterEvent: self
]
