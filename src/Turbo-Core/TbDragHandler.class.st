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
	anEvent currentTarget space dispatchEvent: (TbSpaceDragCancelEvent new delegate: delegate; position: anEvent position)
]

{ #category : #'dnd handlers' }
TbDragHandler >> dragStartEvent: anEvent [
	anEvent consumed: true.

	delegate items: { TbDragItem new sourceElement: anEvent currentTarget }.

	anEvent currentTarget space dispatchEvent: (TbSpaceDragLiftEvent new delegate: delegate; position: anEvent position)
]

{ #category : #initialization }
TbDragHandler >> initialize [
	super initialize.

	delegate := TbDragDelegate new
]
