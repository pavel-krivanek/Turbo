Class {
	#name : 'TbDragOverEvent',
	#superclass : 'TbBaseDragEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbDragOverEvent >> sendTo: anObject [
	anObject dragOverEvent: self
]
