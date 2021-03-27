Class {
	#name : #BlDragEndEvent,
	#superclass : #BlBaseDragEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlDragEndEvent >> sendTo: anObject [
	anObject dragEndEvent: self
]
