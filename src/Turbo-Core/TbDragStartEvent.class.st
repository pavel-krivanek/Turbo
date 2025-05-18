Class {
	#name : 'TbDragStartEvent',
	#superclass : 'TbBaseDragEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbDragStartEvent >> sendTo: anObject [
	anObject dragStartEvent: self
]
