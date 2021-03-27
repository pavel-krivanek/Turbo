Class {
	#name : #BlSpaceMovedEvent,
	#superclass : #BlSpaceEvent,
	#instVars : [
		'position'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #accessing }
BlSpaceMovedEvent >> position [
	^ position
]

{ #category : #accessing }
BlSpaceMovedEvent >> position: anObject [
	position := anObject
]

{ #category : #sending }
BlSpaceMovedEvent >> sendTo: anObject [
	anObject spaceMovedEvent: self
]
