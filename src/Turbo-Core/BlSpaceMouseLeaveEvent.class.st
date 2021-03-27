Class {
	#name : #BlSpaceMouseLeaveEvent,
	#superclass : #BlSpaceEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #'as yet unclassified' }
BlSpaceMouseLeaveEvent >> sendTo: anObject [
	anObject spaceMouseLeaveEvent: self
]
