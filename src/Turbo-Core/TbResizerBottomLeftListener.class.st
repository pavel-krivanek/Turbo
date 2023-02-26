Class {
	#name : #TbResizerBottomLeftListener,
	#superclass : #TbResizerListener,
	#category : #'Turbo-Core-Utilities - Resizable'
}

{ #category : #resizer }
TbResizerBottomLeftListener >> resizeBounds: aBlBounds by: aPoint [
	| newExtent |
	
	newExtent := (aBlBounds extent + (aPoint x negated @ aPoint y)) max: self minimumExtent.

	aBlBounds
		origin: (aBlBounds position x + (aBlBounds extent - newExtent) x) @ aBlBounds position y
		extent: newExtent
]

{ #category : #resizer }
TbResizerBottomLeftListener >> resizerCursor [
	^ TbCursor resizeBottomLeft
]
