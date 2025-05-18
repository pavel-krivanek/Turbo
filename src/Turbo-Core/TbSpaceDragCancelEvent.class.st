Class {
	#name : 'TbSpaceDragCancelEvent',
	#superclass : 'TbSpaceEvent',
	#instVars : [
		'delegate',
		'position'
	],
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'accessing' }
TbSpaceDragCancelEvent >> delegate [
	^ delegate
]

{ #category : 'accessing' }
TbSpaceDragCancelEvent >> delegate: anObject [
	delegate := anObject
]

{ #category : 'accessing' }
TbSpaceDragCancelEvent >> position [
	^ position
]

{ #category : 'accessing' }
TbSpaceDragCancelEvent >> position: anObject [
	position := anObject
]

{ #category : 'sending' }
TbSpaceDragCancelEvent >> sendTo: anObject [
	anObject spaceDragCancel: self
]
