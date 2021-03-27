Class {
	#name : #BlSpaceFocusOutEvent,
	#superclass : #BlSpaceEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #'as yet unclassified' }
BlSpaceFocusOutEvent >> sendTo: anObject [
	anObject spaceFocusOutEvent: self
]
