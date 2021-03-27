Class {
	#name : #TbMultipleDragHandler,
	#superclass : #TbElementEventListener,
	#instVars : [
		'delegate'
	],
	#category : #'Turbo-Core-Utilities - Drag&Drop'
}

{ #category : #accessing }
TbMultipleDragHandler >> delegate [
	^ delegate
]

{ #category : #accessing }
TbMultipleDragHandler >> delegate: anObject [
	delegate := anObject
]

{ #category : #'dnd handlers' }
TbMultipleDragHandler >> dragEndEvent: anEvent [
	anEvent currentTarget space dispatchEvent: (BlSpaceDragCancelEvent new delegate: delegate; position: anEvent position)
]

{ #category : #'dnd handlers' }
TbMultipleDragHandler >> dragStartEvent: anEvent [

"	theDraggedItems := anEvent currentTarget childrenCount timesCollect: [  BlDragItem new ].
	theDraggedItems
		ifEmpty: [ ^ self ].

	theDraggedItems
		with: anEvent currentTarget children
		do: [ :aDragItem :aSourceElement | aDragItem dragSession: (BlDragSession new sourceElement: aSourceElement)].
	anEvent consumed: true.

	anEvent currentTarget space dispatchEvent: (BlSpaceDragLiftEvent new dragItems: theDraggedItems)."
	
	anEvent consumed: true.

	delegate items: (anEvent currentTarget children collect: [ :aChild | BlDragItem new sourceElement: aChild ]).
	anEvent currentTarget space dispatchEvent: (BlSpaceDragLiftEvent new delegate: delegate; position: anEvent position)
]

{ #category : #initialization }
TbMultipleDragHandler >> initialize [
	super initialize.

	delegate := BlDragDelegate new
]
