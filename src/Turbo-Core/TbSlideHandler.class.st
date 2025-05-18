Class {
	#name : 'TbSlideHandler',
	#superclass : 'TbElementEventListener',
	#instVars : [
		'originalPosition',
		'dragStartPosition'
	],
	#category : 'Turbo-Core-Utilities - Drag&Drop',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Drag&Drop'
}

{ #category : 'dnd handlers' }
TbSlideHandler >> dragEvent: anEvent [
	| aSlideDelta |
	anEvent consumed: true.
	
	aSlideDelta := anEvent localPosition - dragStartPosition.

	anEvent currentTarget children accountedByLayout do: [ :aChild | aChild relocate: aChild position + aSlideDelta ].
	dragStartPosition := anEvent localPosition.
]

{ #category : 'dnd handlers' }
TbSlideHandler >> dragStartEvent: anEvent [
	anEvent consumed: true.

	"drag start position in local"
	dragStartPosition := anEvent localPosition.
]
