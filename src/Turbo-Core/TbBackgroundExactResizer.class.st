Class {
	#name : 'TbBackgroundExactResizer',
	#superclass : 'TbBackgroundResizer',
	#instVars : [
		'extent'
	],
	#category : 'Turbo-Core-Basic-Background',
	#package : 'Turbo-Core',
	#tag : 'Basic-Background'
}

{ #category : 'resizing' }
TbBackgroundExactResizer >> adapt: aBackground to: anElement [
	aBackground matchExtent: self extent
]

{ #category : 'accessing' }
TbBackgroundExactResizer >> extent [
	^ extent
]

{ #category : 'accessing' }
TbBackgroundExactResizer >> extent: anObject [
	extent := anObject
]
