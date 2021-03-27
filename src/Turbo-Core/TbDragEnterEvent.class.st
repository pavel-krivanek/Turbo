Class {
	#name : #TbDragEnterEvent,
	#superclass : #TbBaseDragEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbDragEnterEvent >> sendTo: anObject [
	anObject dragEnterEvent: self
]
