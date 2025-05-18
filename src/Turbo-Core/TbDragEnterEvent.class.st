Class {
	#name : 'TbDragEnterEvent',
	#superclass : 'TbBaseDragEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbDragEnterEvent >> sendTo: anObject [
	anObject dragEnterEvent: self
]
