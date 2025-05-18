Class {
	#name : 'TbDragLeaveEvent',
	#superclass : 'TbBaseDragEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbDragLeaveEvent >> sendTo: anObject [
	anObject dragLeaveEvent: self
]
