Class {
	#name : 'TbSpaceEvent',
	#superclass : 'TbEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'testing' }
TbSpaceEvent >> isSpaceCloseRequest [
	^ false
]

{ #category : 'testing' }
TbSpaceEvent >> isSpaceEvent [
	^ true
]

{ #category : 'testing' }
TbSpaceEvent >> isSpaceResizedEvent [
	^ false
]

{ #category : 'sending' }
TbSpaceEvent >> sendTo: anObject [
	anObject spaceEvent: self
]
