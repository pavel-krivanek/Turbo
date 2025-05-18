Class {
	#name : 'TbResizerTopLeftListener',
	#superclass : 'TbResizerListener',
	#category : 'Turbo-Core-Utilities - Resizable',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Resizable'
}

{ #category : 'resizer' }
TbResizerTopLeftListener >> resizeBounds: aBlBounds by: aPoint [
	| newExtent |
	
	newExtent := (aBlBounds extent + aPoint negated) max: self minimumExtent.

	aBlBounds
		origin: aBlBounds position + (aBlBounds extent - newExtent)
		extent: newExtent
]

{ #category : 'resizer' }
TbResizerTopLeftListener >> resizerCursor [
	^ TbCursor resizeTopLeft
]
