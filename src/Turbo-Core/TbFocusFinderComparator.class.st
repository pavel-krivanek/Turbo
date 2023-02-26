"
I sort element according to their visual layout and geometry
"
Class {
	#name : #TbFocusFinderComparator,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'rootElement',
		'firstBounds',
		'secondBounds'
	],
	#category : #'Turbo-Core-Utilities - Focus'
}

{ #category : #private }
TbFocusFinderComparator >> bounds: aBlBounds of: anElement [
	"Store and return visual bounds of a given element in root's coordinates
	that will be used for comparison.
	Note: I return mutable BlBounds instance that is shared between all comparison
	operations. By convention focus search can only be happen from UI thread, so it
	is safe to share bounds instance"
	<return: #BlBounds>
	
	anElement boundsInLocal: aBlBounds.
	^ rootElement localBoundsToMine: aBlBounds fromChild: anElement
]

{ #category : #initialization }
TbFocusFinderComparator >> initialize [
	super initialize.
	
	firstBounds := TbBounds new.
	secondBounds := TbBorder new
]

{ #category : #testing }
TbFocusFinderComparator >> isRightToLeft [
	"Return true if I compare element in a context of right to left layout, false otherwise"
	<return: #Boolean>

	^ false
]

{ #category : #accessing }
TbFocusFinderComparator >> rootElement [
	"Return an element that plays a role of a root for a visual focus search"
	<return: #BlElement>
	
	^ rootElement
]

{ #category : #accessing }
TbFocusFinderComparator >> rootElement: anElement [
	"Set an element that should be considered a root during visual focus search.
	Note: element are compared by their visual bounds transformed to local coordinates
	of a root element"
	
	rootElement := anElement
]

{ #category : #evaluating }
TbFocusFinderComparator >> value: aFirstElement value: aSecondElement [
	" I sort elements according to the following strategy:
	
	1) A rectangle that is located higher gets higher priority,
	so A will be higher in the sorted list than B:
	
	|----------|
	|    A     |       
	|__________|      
	
	|-----------|
	|     B     |
	|___________|
	
	2) A rectangle with smaller x coodinate of a left edge gets higher priority,
	A will be before B:
	Note: if layout is left to right, then B should be first (reversed order)
	
	|---------|  |---------|
	|    A    |  |    B    |
	|_________|  |_________|
	"
	<return: #Number>
	
	self bounds: firstBounds of: aFirstElement.
	self bounds: secondBounds of: aSecondElement.
	
	(firstBounds top < secondBounds top)
		ifTrue: [ ^ -1 ].
	
	(firstBounds top > secondBounds top)
		ifTrue: [ ^ 1 ].
	
	(firstBounds left < secondBounds left)
		ifTrue: [ ^ self isRightToLeft
			ifTrue: [ 1 ]
			ifFalse: [ -1 ] ].
	
	(firstBounds left > secondBounds left)
		ifTrue: [ ^ self isRightToLeft
			ifTrue: [ -1 ]
			ifFalse: [ 1 ] ].
	
	(firstBounds bottom < secondBounds bottom)
		ifTrue: [ ^ -1 ].
	
	(firstBounds bottom > secondBounds bottom)
		ifTrue: [ ^ 1 ].
	
	(firstBounds right < secondBounds right)
		ifTrue: [ ^ self isRightToLeft
			ifTrue: [ 1 ]
			ifFalse: [ -1 ] ].
	
	(firstBounds right > secondBounds right)
		ifTrue: [ ^ self isRightToLeft
			ifTrue: [ -1 ]
			ifFalse: [ 1 ] ].
	
	"elements are distinct, treat them as equal"
	^ 0
]
