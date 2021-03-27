Class {
	#name : #BlDragLeaveEvent,
	#superclass : #BlBaseDragEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlDragLeaveEvent >> sendTo: anObject [
	anObject dragLeaveEvent: self
]
