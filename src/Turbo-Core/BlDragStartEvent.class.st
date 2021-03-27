Class {
	#name : #BlDragStartEvent,
	#superclass : #BlBaseDragEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlDragStartEvent >> sendTo: anObject [
	anObject dragStartEvent: self
]
