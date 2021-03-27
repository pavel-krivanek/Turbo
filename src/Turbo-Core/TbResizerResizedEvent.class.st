"
I am sent by an element with applied Resizer Listener after the resizing target was resized
"
Class {
	#name : #TbResizerResizedEvent,
	#superclass : #TbEvent,
	#instVars : [
		'extent'
	],
	#category : #'Turbo-Core-Utilities - Resizable'
}

{ #category : #accessing }
TbResizerResizedEvent >> extent [
	^ extent
]

{ #category : #accessing }
TbResizerResizedEvent >> extent: aPoint [
	extent := aPoint
]
