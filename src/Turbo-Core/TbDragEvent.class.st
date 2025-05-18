Class {
	#name : 'TbDragEvent',
	#superclass : 'TbBaseDragEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'testing' }
TbDragEvent >> isDrag [
	^ true
]

{ #category : 'sending' }
TbDragEvent >> sendTo: anObject [
	anObject dragEvent: self
]
