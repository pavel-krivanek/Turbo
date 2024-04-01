Class {
	#name : #TbSpaceEventEndEvent,
	#superclass : #TbSpaceStepEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbSpaceEventEndEvent >> sendTo: anObject [
	anObject spaceEventProcessedEvent: self
]
