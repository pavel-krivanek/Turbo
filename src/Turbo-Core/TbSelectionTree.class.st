"
I represent an augmented search binary tree to store intervals  described in Cormen et al. (2009, Section 14.3: Interval trees, pp. 348–354)[1]

I am used by ${class:BlCompositeSelection}$

I do not allow overlapping intervals to be stored in the same tree. Before every insertions I find overlapping and neighbouring intervals, merge them and replace all merged intervals with a single one.

For example if tree contains the following intervals: [1,2] [5, 10] and user inserts a new one [3,4] then resulting tree will only consist of a single [1,10] interval.

Both insertions and deletion have logarithmic complexity O(logN) where N is current amount of intervals stored.

[1] Cormen, Thomas H.; Leiserson, Charles E.; Rivest, Ronald L.; Stein, Clifford (2009), Introduction to Algorithms (3rd ed.), MIT Press and McGraw-Hill, ISBN 978-0-262-03384-8
"
Class {
	#name : 'TbSelectionTree',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'root'
	],
	#category : 'Turbo-Core-Utilities - Selection',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Selection'
}

{ #category : 'comparing' }
TbSelectionTree >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].

	self hasRoot = anObject hasRoot
		ifFalse: [ ^ false ].
		
	^ self hasRoot
		ifTrue: [ self root = anObject root ]
		ifFalse: [ false ]
]

{ #category : 'tree - testing' }
TbSelectionTree >> contains: anIndex [
	"Return true if this selection interval includes a given index, false otherwise"
	<return: #Boolean>
	
	^ self hasRoot
		ifTrue: [ self root contains: anIndex ]
		ifFalse: [ false ]
]

{ #category : 'tree - deletion' }
TbSelectionTree >> delete: aMonotoneTextSelection [
	| theOverlapping |
	self hasRoot
		ifFalse: [ ^ self ].
		
	theOverlapping := self findOverlapping: aMonotoneTextSelection.
	theOverlapping
		ifEmpty: [ ^ self ].
	
	theOverlapping reverseDo: #delete.
	
	theOverlapping
		collect: [ :aSelectionNode | aSelectionNode selection complement: aMonotoneTextSelection ]
		thenDo: [ :aComplementSelection | aComplementSelection
			do: [ :aSelection | aSelection isNotEmpty ifTrue: [ self insert: aSelection ] ] ]
]

{ #category : 'tree - enumerating' }
TbSelectionTree >> do: aBlock [
	self hasRoot
		ifTrue: [ self root do: aBlock ]
]

{ #category : 'tree - searching' }
TbSelectionTree >> findOverlapping: aMonotoneTextSelection [
	<return: #Collection of: #BlMonotoneSelection>
	
	^ Array streamContents: [ :aStream | self overlapping: aMonotoneTextSelection in: aStream ]
]

{ #category : 'tree - searching' }
TbSelectionTree >> findOverlappingNeighbours: aMonotoneTextSelection [
	<return: #Collection of: #BlMonotoneSelection>
	
	^ Array streamContents: [ :aStream | self overlappingNeighbours: aMonotoneTextSelection in: aStream ]
]

{ #category : 'accessing' }
TbSelectionTree >> first [
	self
		assert: [ self hasRoot ]
		description: [ 'There must be root!' ].
		
	^ self root findMin
]

{ #category : 'tree - testing' }
TbSelectionTree >> hasRoot [
	^ root isNotNil
]

{ #category : 'comparing' }
TbSelectionTree >> hash [
	^ self hasRoot
		ifTrue: [ self root hash bitXor: self class hash ]
		ifFalse: [ self class hash ]
]

{ #category : 'tree - inserting' }
TbSelectionTree >> insert: aMonotoneTextSelection [
	| theNeighbours newFrom newTo |
	
	aMonotoneTextSelection isEmpty
		ifTrue: [ ^ self ].
	
	self hasRoot
		ifFalse: [ root := (TbSelectionNode selection: aMonotoneTextSelection) parent: self. ^ self ].
		
	theNeighbours := self findOverlappingNeighbours: aMonotoneTextSelection.
	theNeighbours
		ifEmpty: [ self root insert: aMonotoneTextSelection. ^ self ].
		
	newFrom := theNeighbours first selection from min: aMonotoneTextSelection from.
	newTo := theNeighbours last selection to max: aMonotoneTextSelection to.
	
	theNeighbours reverseDo: #delete.
	self hasRoot
		ifFalse: [ root := (TbSelectionNode selection: (TbSelection from: newFrom to: newTo)) parent: self. ^ self ].
	self root insert: (TbSelection from: newFrom to: newTo)
]

{ #category : 'tree - testing' }
TbSelectionTree >> isEmpty [
	^ self hasRoot not
]

{ #category : 'tree - testing' }
TbSelectionTree >> isNotEmpty [
	^ self hasRoot
]

{ #category : 'tree - testing' }
TbSelectionTree >> isRoot [
	^ true
]

{ #category : 'accessing' }
TbSelectionTree >> last [
	self
		assert: [ self hasRoot ]
		description: [ 'There must be root!' ].
		
	^ self root findMax
]

{ #category : 'tree - searching' }
TbSelectionTree >> overlapping: aMonotoneTextSelection in: aStream [
	
	self hasRoot
		ifTrue: [ self root overlapping: aMonotoneTextSelection in: aStream ]
]

{ #category : 'tree - searching' }
TbSelectionTree >> overlappingNeighbours: aMonotoneTextSelection in: aStream [
	
	self hasRoot
		ifTrue: [ self root overlappingNeighbours: aMonotoneTextSelection in: aStream ]
]

{ #category : 'printing' }
TbSelectionTree >> printOn: aStream [

	self hasRoot
		ifTrue: [ self root printOn: aStream ]
]

{ #category : 'tree - deletion' }
TbSelectionTree >> removeRoot [
	root := nil
]

{ #category : 'tree - enumerating' }
TbSelectionTree >> reverseDo: aBlock [
	self hasRoot
		ifTrue: [ self root reverseDo: aBlock ]
]

{ #category : 'accessing' }
TbSelectionTree >> root [
	<return: #BlSelectionNode>
	
	self
		assert: [ root isNotNil ]
		description: [ 'Root can not be nil' ].
	
	^ root
]

{ #category : 'accessing' }
TbSelectionTree >> root: aTextSelectionNode [
	root := aTextSelectionNode
]
