"
Is sent when elemen't position in space coordinates changes.

Position in space may change even if element's #position is still the same. It can happen when any of its parents moves.
"
Class {
	#name : 'TbElementPositionInSpaceChangedEvent',
	#superclass : 'TbElementEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbElementPositionInSpaceChangedEvent >> sendTo: anObject [
	anObject elementPositionInSpaceChanged: self
]
