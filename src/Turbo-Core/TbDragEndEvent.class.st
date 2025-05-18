Class {
	#name : 'TbDragEndEvent',
	#superclass : 'TbBaseDragEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbDragEndEvent >> sendTo: anObject [
	anObject dragEndEvent: self
]
