Class {
	#name : #TbDragLeaveEvent,
	#superclass : #TbBaseDragEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbDragLeaveEvent >> sendTo: anObject [
	anObject dragLeaveEvent: self
]
