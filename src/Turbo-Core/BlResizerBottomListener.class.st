Class {
	#name : #BlResizerBottomListener,
	#superclass : #BlResizerListener,
	#category : #'Turbo-Core-Utilities - Resizable'
}

{ #category : #resizer }
BlResizerBottomListener >> resizeBounds: aBlBounds by: aPoint [
	aBlBounds extent: ((aBlBounds extent + (0 @ aPoint y)) max: self minimumExtent)
]

{ #category : #resizer }
BlResizerBottomListener >> resizerCursor [
	^ BlCursor resizeBottom
]
