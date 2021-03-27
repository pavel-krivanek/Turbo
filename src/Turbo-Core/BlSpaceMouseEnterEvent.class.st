Class {
	#name : #BlSpaceMouseEnterEvent,
	#superclass : #BlSpaceEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #'as yet unclassified' }
BlSpaceMouseEnterEvent >> sendTo: anObject [
	anObject spaceMouseEnterEvent: self
]
