Class {
	#name : 'TbSpaceFocusInEvent',
	#superclass : 'TbSpaceEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbSpaceFocusInEvent >> sendTo: anObject [
	anObject spaceFocusInEvent: self
]
