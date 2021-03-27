"
I extend selection handler in the sense that I add a visual selection rectangle that resizes itself during mouse drag.

I simulate Desktop behaviour of most OS
"
Class {
	#name : #TbVisualSelectionHandler,
	#superclass : #TbSelectionHandler,
	#instVars : [
		'selection'
	],
	#category : #'Turbo-Core-Utilities - Selection'
}

{ #category : #'dnd handlers' }
TbVisualSelectionHandler >> dragEndEvent: anEvent [
	super dragEndEvent: anEvent.
	
	container removeChild: selection
]

{ #category : #'dnd handlers' }
TbVisualSelectionHandler >> dragStartEvent: anEvent [
	super dragStartEvent: anEvent.
	
	container addChild: selection
]

{ #category : #'mouse handlers' }
TbVisualSelectionHandler >> mouseDownEvent: anEvent [
	| oldSelected |
	super mouseDownEvent: anEvent.
	
	oldSelected := selected copy.
	selected removeAll.
	oldSelected keysDo: [ :anElement | self handleDeselected: anElement ]
]

{ #category : #installation }
TbVisualSelectionHandler >> onInstalledIn: anElement [
	super onInstalledIn: anElement.

	selection := BlElement new
		size: 0@0;
		background: (Color blue alpha: 0.1);
		border: (BlBorder builder paint: (Color blue alpha: 0.7); width: 2; build);
		yourself
]

{ #category : #'selection - handling' }
TbVisualSelectionHandler >> selectionChanged [
	| aSelectionBounds |
	super selectionChanged.
	
	aSelectionBounds := BlBounds fromRectangle: ((origin min: corner) corner: (corner max: origin)).
	aSelectionBounds := container globalBoundsToLocal: aSelectionBounds.

	selection
		relocate: aSelectionBounds origin;
		size: aSelectionBounds extent
]
