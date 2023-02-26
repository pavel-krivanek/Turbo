Class {
	#name : #TbDragStartEvent,
	#superclass : #TbBaseDragEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbDragStartEvent >> sendTo: anObject [
	anObject dragStartEvent: self
]
