Class {
	#name : 'TbSpaceEventEndEvent',
	#superclass : 'TbSpaceStepEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbSpaceEventEndEvent >> sendTo: anObject [
	anObject spaceEventProcessedEvent: self
]
