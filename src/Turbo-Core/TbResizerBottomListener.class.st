Class {
	#name : #TbResizerBottomListener,
	#superclass : #TbResizerListener,
	#category : #'Turbo-Core-Utilities - Resizable'
}

{ #category : #resizer }
TbResizerBottomListener >> resizeBounds: aBlBounds by: aPoint [
	aBlBounds extent: ((aBlBounds extent + (0 @ aPoint y)) max: self minimumExtent)
]

{ #category : #resizer }
TbResizerBottomListener >> resizerCursor [
	^ TbCursor resizeBottom
]
