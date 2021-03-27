Class {
	#name : #BlDragOverEvent,
	#superclass : #BlBaseDragEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlDragOverEvent >> sendTo: anObject [
	anObject dragOverEvent: self
]
