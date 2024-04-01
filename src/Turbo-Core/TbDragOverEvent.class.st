Class {
	#name : #TbDragOverEvent,
	#superclass : #TbBaseDragEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbDragOverEvent >> sendTo: anObject [
	anObject dragOverEvent: self
]
