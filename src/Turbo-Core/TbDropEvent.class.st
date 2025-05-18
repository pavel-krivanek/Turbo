Class {
	#name : 'TbDropEvent',
	#superclass : 'TbBaseDragEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbDropEvent >> sendTo: anObject [
	anObject dropEvent: self
]
