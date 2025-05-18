"
Is sent when element's extent in local coordinates changes.
"
Class {
	#name : 'TbElementExtentChangedEvent',
	#superclass : 'TbElementEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbElementExtentChangedEvent >> sendTo: anObject [
	anObject elementExtentChanged: self
]
