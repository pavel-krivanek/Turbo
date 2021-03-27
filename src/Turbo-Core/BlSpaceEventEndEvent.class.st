Class {
	#name : #BlSpaceEventEndEvent,
	#superclass : #BlSpaceStepEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlSpaceEventEndEvent >> sendTo: anObject [
	anObject spaceEventProcessedEvent: self
]
