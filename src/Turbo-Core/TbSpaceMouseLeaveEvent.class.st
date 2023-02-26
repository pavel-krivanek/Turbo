Class {
	#name : #TbSpaceMouseLeaveEvent,
	#superclass : #TbSpaceEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #'as yet unclassified' }
TbSpaceMouseLeaveEvent >> sendTo: anObject [
	anObject spaceMouseLeaveEvent: self
]
