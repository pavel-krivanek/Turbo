Class {
	#name : #TbDropEvent,
	#superclass : #TbBaseDragEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbDropEvent >> sendTo: anObject [
	anObject dropEvent: self
]
