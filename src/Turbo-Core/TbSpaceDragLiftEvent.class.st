Class {
	#name : #TbSpaceDragLiftEvent,
	#superclass : #TbSpaceEvent,
	#instVars : [
		'delegate',
		'position'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #accessing }
TbSpaceDragLiftEvent >> delegate [
	^ delegate
]

{ #category : #accessing }
TbSpaceDragLiftEvent >> delegate: anObject [
	delegate := anObject
]

{ #category : #accessing }
TbSpaceDragLiftEvent >> position [
	^ position
]

{ #category : #accessing }
TbSpaceDragLiftEvent >> position: anObject [
	position := anObject
]

{ #category : #sending }
TbSpaceDragLiftEvent >> sendTo: anObject [
	anObject spaceDragLift: self
]
