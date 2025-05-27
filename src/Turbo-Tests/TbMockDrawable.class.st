Class {
	#name : 'TbMockDrawable',
	#superclass : 'Object',
	#instVars : [
		'drawnOn'
	],
	#category : 'Turbo-Tests',
	#package : 'Turbo-Tests'
}

{ #category : 'as yet unclassified' }
TbMockDrawable >> fullDrawOnTurboCanvas: aCanvas [ 
    drawnOn := aCanvas.
]

{ #category : 'as yet unclassified' }
TbMockDrawable >> wasDrawnOn: aCanvas [
    ^ drawnOn = aCanvas
]
