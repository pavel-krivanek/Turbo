Class {
	#name : #TbResizerRightListener,
	#superclass : #TbResizerListener,
	#category : #'Turbo-Core-Utilities - Resizable'
}

{ #category : #resizer }
TbResizerRightListener >> resizeBounds: aBlBounds by: aPoint [
	aBlBounds extent: ((aBlBounds extent + (aPoint x @ 0)) max: self minimumExtent)
]

{ #category : #resizer }
TbResizerRightListener >> resizerCursor [
	^ TbCursor resizeRight
]
