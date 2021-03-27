Class {
	#name : #BlDropEvent,
	#superclass : #BlBaseDragEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlDropEvent >> sendTo: anObject [
	anObject dropEvent: self
]
