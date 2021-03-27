Class {
	#name : #TbDragHandler,
	#superclass : #TbElementEventListener,
	#instVars : [
		'delegate'
	],
	#category : #'Turbo-Core-Utilities - Drag&Drop'
}

{ #category : #accessing }
TbDragHandler >> delegate [
	<return: #BlDragDelegate>

	^ delegate
]

{ #category : #accessing }
TbDragHandler >> delegate: aBlDragDelegate [
	delegate := aBlDragDelegate
]

{ #category : #'dnd handlers' }
TbDragHandler >> dragEndEvent: anEvent [
	anEvent currentTarget space dispatchEvent: (BlSpaceDragCancelEvent new delegate: delegate; position: anEvent position)
]

{ #category : #'dnd handlers' }
TbDragHandler >> dragStartEvent: anEvent [
	anEvent consumed: true.

	delegate items: { BlDragItem new sourceElement: anEvent currentTarget }.

	anEvent currentTarget space dispatchEvent: (BlSpaceDragLiftEvent new delegate: delegate; position: anEvent position)
]

{ #category : #initialization }
TbDragHandler >> initialize [
	super initialize.

	delegate := BlDragDelegate new
]
