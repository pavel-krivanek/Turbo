Class {
	#name : 'TbSpaceResizedEvent',
	#superclass : 'TbSpaceEvent',
	#instVars : [
		'extent'
	],
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'accessing' }
TbSpaceResizedEvent >> extent [
	"Return window size in screen coordinates"
	^ extent
]

{ #category : 'accessing' }
TbSpaceResizedEvent >> extent: anObject [
	extent := anObject
]

{ #category : 'testing' }
TbSpaceResizedEvent >> isSpaceResizedEvent [
	^ true
]

{ #category : 'sending' }
TbSpaceResizedEvent >> sendTo: anObject [
	anObject spaceResizedEvent: self
]
