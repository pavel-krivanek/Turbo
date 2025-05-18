"
Is sent when element is no longer within mouse selection rectangle
"
Class {
	#name : 'TbElementSelectionLostEvent',
	#superclass : 'TbElementEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbElementSelectionLostEvent >> sendTo: anObject [
	anObject selectionLostEvent: self
]
