Class {
	#name : 'TbSpaceMouseEnterEvent',
	#superclass : 'TbSpaceEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'as yet unclassified' }
TbSpaceMouseEnterEvent >> sendTo: anObject [
	anObject spaceMouseEnterEvent: self
]
