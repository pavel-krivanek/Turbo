Class {
	#name : 'TbSpaceMouseLeaveEvent',
	#superclass : 'TbSpaceEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'as yet unclassified' }
TbSpaceMouseLeaveEvent >> sendTo: anObject [
	anObject spaceMouseLeaveEvent: self
]
