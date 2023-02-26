Class {
	#name : #TbDragEndEvent,
	#superclass : #TbBaseDragEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbDragEndEvent >> sendTo: anObject [
	anObject dragEndEvent: self
]
