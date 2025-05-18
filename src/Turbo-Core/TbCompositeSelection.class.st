"
I am a composite text selection consisting of multiple independent non-overlapping monotone text selections
"
Class {
	#name : 'TbCompositeSelection',
	#superclass : 'TbSelection',
	#instVars : [
		'selections'
	],
	#category : 'Turbo-Core-Utilities - Selection',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Selection'
}

{ #category : 'comparing' }
TbCompositeSelection >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].

	^ self selections = anObject selections
]

{ #category : 'private - adding / removing' }
TbCompositeSelection >> add: aMonotoneTextSelection [
	selections insert: aMonotoneTextSelection
]

{ #category : 'accessing' }
TbCompositeSelection >> children [
	<return: #Collection of: #BlSelection>
	
	^ #()
]

{ #category : 'api - testing' }
TbCompositeSelection >> contains: anIndex [
	"Return true if this selection interval includes a given index, false otherwise"
	<return: #Boolean>
	
	^ selections contains: anIndex
]

{ #category : 'api - selection' }
TbCompositeSelection >> deselect: aSelection [
	"Remove a given selection"

	aSelection do: [ :aMonotoneSelection | self remove: aMonotoneSelection ]
]

{ #category : 'api - selection' }
TbCompositeSelection >> deselect: aFromIndex to: aToIndex [
	"Remove a monotone selection within provided indices"
	
	self remove: (TbSelection from: aFromIndex to: aToIndex)
]

{ #category : 'api - enumerating' }
TbCompositeSelection >> do: aBlock [
	selections do: aBlock
]

{ #category : 'api - accessing' }
TbCompositeSelection >> from [
	"Return the minimum selected index which is the `from` index of the first sub-selection"
	<return: #Number>

	^ selections first selection from
]

{ #category : 'printing' }
TbCompositeSelection >> gtDisplayOn: aStream [
	self printOn: aStream
]

{ #category : 'comparing' }
TbCompositeSelection >> hash [
	^ self class hash bitXor: self selections hash
]

{ #category : 'initialization' }
TbCompositeSelection >> initialize [
	super initialize.
	
	selections := TbSelectionTree new
]

{ #category : 'api - testing' }
TbCompositeSelection >> isEmpty [
	^ selections isEmpty
]

{ #category : 'api - testing' }
TbCompositeSelection >> isNotEmpty [
	^ selections isNotEmpty
]

{ #category : 'printing' }
TbCompositeSelection >> printOn: aStream [
	selections printOn: aStream
]

{ #category : 'private - adding / removing' }
TbCompositeSelection >> remove: aMonotoneTextSelection [
	selections delete: aMonotoneTextSelection
]

{ #category : 'private - adding / removing' }
TbCompositeSelection >> removeAll [
	selections := TbSelectionTree new
]

{ #category : 'api - enumerating' }
TbCompositeSelection >> reverseDo: aBlock [
	"Evaluate a given block with all recorded selection intervals in reverse direction"

	selections reverseDo: aBlock
]

{ #category : 'api - selection' }
TbCompositeSelection >> select: aSelection [
	"Add a given selection"

	aSelection do: [ :aMonotoneSelection | self add: aMonotoneSelection ]
]

{ #category : 'api - selection' }
TbCompositeSelection >> select: aFromIndex to: aToIndex [
	"Add a new monotone selection merging it with existing ones within provided indices"
	
	self add: (TbSelection from: aFromIndex to: aToIndex)
]

{ #category : 'accessing' }
TbCompositeSelection >> selections [
	<return: #BlSelectionTree>

	^ selections
]

{ #category : 'api - accessing' }
TbCompositeSelection >> to [
	"Return the maximum selected index which is the `to` index of the last sub-selection"
	<return: #Number>

	^ selections last selection to
]
