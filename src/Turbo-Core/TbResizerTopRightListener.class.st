Class {
	#name : #TbResizerTopRightListener,
	#superclass : #TbResizerListener,
	#category : #'Turbo-Core-Utilities - Resizable'
}

{ #category : #resizer }
TbResizerTopRightListener >> resizeBounds: aBlBounds by: aPoint [
	| newExtent |
	
	newExtent := (aBlBounds extent + (aPoint x @ aPoint y negated)) max: self minimumExtent.

	aBlBounds
		origin: aBlBounds position x @ (aBlBounds position y + (aBlBounds extent - newExtent) y)
		extent: newExtent
]

{ #category : #resizer }
TbResizerTopRightListener >> resizerCursor [
	^ TbCursor resizeTopRight
]
