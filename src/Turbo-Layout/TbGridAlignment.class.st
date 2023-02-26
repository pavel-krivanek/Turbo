Class {
	#name : #TbGridAlignment,
	#superclass : #Object,
	#pools : [
		'TbGridLayoutConstants'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Turbo-Layout-Grid-Utilities'
}

{ #category : #factory }
TbGridAlignment class >> baseline [
	^ TbGridBaselineAlignment uniqueInstance
]

{ #category : #factory }
TbGridAlignment class >> bottom [
	^ self trailing
]

{ #category : #factory }
TbGridAlignment class >> center [
	^ TbGridCenterAlignment uniqueInstance
]

{ #category : #cleanup }
TbGridAlignment class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #factory }
TbGridAlignment class >> end [
	^ self trailing
]

{ #category : #factory }
TbGridAlignment class >> fill [
	^ TbGridFillAlignment uniqueInstance
]

{ #category : #factory }
TbGridAlignment class >> leading [
	^ TbGridLeadingAlignment uniqueInstance
]

{ #category : #factory }
TbGridAlignment class >> left [
	^ self start
]

{ #category : #factory }
TbGridAlignment class >> right [
	^ self end
]

{ #category : #factory }
TbGridAlignment class >> start [
	^ self leading
]

{ #category : #factory }
TbGridAlignment class >> top [
	^ self leading
]

{ #category : #factory }
TbGridAlignment class >> trailing [
	^ TbGridTrailingAlignment uniqueInstance
]

{ #category : #factory }
TbGridAlignment class >> undefined [
	^ TbGridUndefinedAlignment uniqueInstance
]

{ #category : #accessing }
TbGridAlignment class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #comparing }
TbGridAlignment >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : #alignment }
TbGridAlignment >> alignmentValue: anElement viewSize: viewSize [
	"Returns an alignment value. In the case of vertical alignments the value
	returned should indicate the distance from the top of the view to the
	alignment location.
	
	For horizontal alignments measurement is made from the left edge of the component.

		view - the view to which this alignment should be applied
		viewSize - the measured size of the view"
	^ self subclassResponsibility
]

{ #category : #accessing }
TbGridAlignment >> bounds [
	^ TbGridLayoutBounds new
]

{ #category : #alignment }
TbGridAlignment >> gravityOffset: anElement cellDelta: cellDelta [
	^ self subclassResponsibility
]

{ #category : #comparing }
TbGridAlignment >> hash [
	^ self class hash
]

{ #category : #testing }
TbGridAlignment >> isFill [
	^ false
]

{ #category : #alignment }
TbGridAlignment >> sizeInCell: anElement viewSize: viewSize cellSize: cellSize [
	"Returns the size of the view specified by this alignment.
	In the case of vertical alignments this method should return a height; for
	horizontal alignments this method should return the width.

	The default implementation returns viewSize.
		anElement - an element to which this alignment should be applied
		viewSize - the measured size of the element
		cellSize - the size of the cell into which this element will be placed"
	^ viewSize
]
