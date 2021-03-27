Class {
	#name : #BlSpaceFocusInEvent,
	#superclass : #BlSpaceEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlSpaceFocusInEvent >> sendTo: anObject [
	anObject spaceFocusInEvent: self
]
