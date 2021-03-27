Class {
	#name : #TbResizerBottomRightListener,
	#superclass : #TbResizerListener,
	#category : #'Turbo-Core-Utilities - Resizable'
}

{ #category : #resizer }
TbResizerBottomRightListener >> resizeBounds: aBlBounds by: aPoint [
	aBlBounds extent: ((aBlBounds extent + aPoint) max: self minimumExtent)
]

{ #category : #resizer }
TbResizerBottomRightListener >> resizerCursor [
	^ BlCursor resizeBottomRight
]
