Class {
	#name : 'TbResizerRightListener',
	#superclass : 'TbResizerListener',
	#category : 'Turbo-Core-Utilities - Resizable',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Resizable'
}

{ #category : 'resizer' }
TbResizerRightListener >> resizeBounds: aBlBounds by: aPoint [
	aBlBounds extent: ((aBlBounds extent + (aPoint x @ 0)) max: self minimumExtent)
]

{ #category : 'resizer' }
TbResizerRightListener >> resizerCursor [
	^ TbCursor resizeRight
]
