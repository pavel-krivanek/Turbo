Class {
	#name : #TbSpaceMouseEnterEvent,
	#superclass : #TbSpaceEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #'as yet unclassified' }
TbSpaceMouseEnterEvent >> sendTo: anObject [
	anObject spaceMouseEnterEvent: self
]
