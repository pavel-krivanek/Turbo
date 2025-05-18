Class {
	#name : 'TbSpaceMovedEvent',
	#superclass : 'TbSpaceEvent',
	#instVars : [
		'position'
	],
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'accessing' }
TbSpaceMovedEvent >> position [
	^ position
]

{ #category : 'accessing' }
TbSpaceMovedEvent >> position: anObject [
	position := anObject
]

{ #category : 'sending' }
TbSpaceMovedEvent >> sendTo: anObject [
	anObject spaceMovedEvent: self
]
