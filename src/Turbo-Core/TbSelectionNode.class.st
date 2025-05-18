"
I represent a single node within interval tree ===BlTextSelectionTree===.

I am a binary node with ===selection=== playing a role of a key (lowest value) and value. Additionally I cache the highest interval value of a subtree including my own interval.
"
Class {
	#name : 'TbSelectionNode',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'left',
		'right',
		'selection',
		'high',
		'parent'
	],
	#category : 'Turbo-Core-Utilities - Selection',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Selection'
}

{ #category : 'instance creation' }
TbSelectionNode class >> selection: aMonotoneTextSelection [
	^ self new selection: aMonotoneTextSelection
]

{ #category : 'comparing' }
TbSelectionNode >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].

	self hasRight = anObject hasRight
		ifFalse: [ ^ false ].

	(self hasRight and: [ self right ~= anObject right ])
		ifTrue: [ ^ false ].
		
	self hasLeft = anObject hasLeft
		ifFalse: [ ^ false ].
		
	(self hasLeft and: [ self left ~= anObject left ])
		ifTrue: [ ^ false ].
		
	self high = anObject high
		ifFalse: [ ^ false ].
		
	self selection = anObject selection
		ifFalse: [ ^ false ].

	^ true
]

{ #category : 'accessing' }
TbSelectionNode >> children [
	"Return a collection of children selection nodes"
	<return: #Array of: #BlSelectionNode>
	
	^ Array streamContents: [ :aStream |
		self hasLeft
			ifTrue: [ aStream nextPut: self left ].
		self hasRight
			ifTrue: [ aStream nextPut: self right ] ]
]

{ #category : 'tree - testing' }
TbSelectionNode >> contains: anIndex [
	"Return true if this selection interval includes a given index, false otherwise"
	<return: #Boolean>

	anIndex > self high
		ifTrue: [ ^ false ].
		
	(self selection contains: anIndex)
		ifTrue: [ ^ true ].
		
	(self hasLeft and: [ anIndex <= self left high ])
		ifTrue: [ ^ self left contains: anIndex ].
		
	(self hasRight and: [ anIndex <= self right high ])
		ifTrue: [ ^ self right contains: anIndex ].
		
	^ false
]

{ #category : 'instance creation' }
TbSelectionNode >> createNode: aSelection [
	^ (self class selection: aSelection)
		parent: self;
		yourself
]

{ #category : 'tree - deletion' }
TbSelectionNode >> delete [
	"Delete me from the tree"

	(self hasLeft and: [ self hasRight ])
		ifTrue: [ 
			| successorNode |
			successorNode := self right findMin.
			selection := successorNode selection.
			successorNode delete ]
		ifFalse: [ 
			self hasLeft
				ifTrue: [ self replaceInParent: self left ]
				ifFalse: [ self hasRight
					ifTrue: [ self replaceInParent: self right ]
					ifFalse: [ self deleteInParent ] ] ]
]

{ #category : 'tree - deletion' }
TbSelectionNode >> deleteInParent [
	"Delete me from the parent"
	self
		assert: [ self hasLeft not and: [ self hasRight not ] ]
		description: [ 'I can not be deleted from the parent if I have children' ].
	
	(self hasParent and: [ self parent isRoot not ])
		ifTrue: [			
			(self parent hasLeft and: [ self parent left == self ])
				ifTrue: [ self parent removeLeft ].
			(self parent hasRight and: [ self parent right == self ])
				ifTrue: [ self parent removeRight ] ].
	
	(self hasParent and: [ self parent isRoot ])
		ifTrue: [ self parent removeRoot ].
	
	"I am deleted and don't have a parent anymore"
	parent := nil
]

{ #category : 'tree - enumerating' }
TbSelectionNode >> do: aBlock [
	self hasLeft
		ifTrue: [ self left do: aBlock ].
		
	aBlock value: self selection.
	
	self hasRight
		ifTrue: [ self right do: aBlock ]
]

{ #category : 'tree - searching' }
TbSelectionNode >> findMax [
	"Return a minimum node in a subtree"
	<return: #BltextSelectionNode>
	| aCurrentNode |
	
	aCurrentNode := self.
	[ aCurrentNode hasRight ]
		whileTrue: [ aCurrentNode := aCurrentNode right ].
	^ aCurrentNode
]

{ #category : 'tree - searching' }
TbSelectionNode >> findMin [
	"Return a minimum node in a subtree"
	<return: #BltextSelectionNode>
	| aCurrentNode |
	
	aCurrentNode := self.
	[ aCurrentNode hasLeft ]
		whileTrue: [ aCurrentNode := aCurrentNode left ].
	^ aCurrentNode
]

{ #category : 'tree - testing' }
TbSelectionNode >> hasLeft [
	^ left isNotNil
]

{ #category : 'tree - testing' }
TbSelectionNode >> hasParent [
	^ parent isNotNil
]

{ #category : 'tree - testing' }
TbSelectionNode >> hasRight [
	^ right isNotNil
]

{ #category : 'accessing' }
TbSelectionNode >> high [
	^ high
]

{ #category : 'tree - inserting' }
TbSelectionNode >> insert: aMonotoneTextSelection [

	aMonotoneTextSelection < self selection
		ifTrue: [
			left
				ifNil: [ left := self createNode: aMonotoneTextSelection ]
				ifNotNil: [ left insert: aMonotoneTextSelection ] ]
		ifFalse: [ 
			right
				ifNil: [ right := self createNode: aMonotoneTextSelection ]
				ifNotNil: [ right insert: aMonotoneTextSelection ] ].
	high := high max: ((left ifNil: [ 0 ] ifNotNil: #high) max: (right ifNil: [ 0 ] ifNotNil: #high))
]

{ #category : 'tree - testing' }
TbSelectionNode >> isRoot [
	^ false
]

{ #category : 'accessing' }
TbSelectionNode >> left [
	self
		assert: [ left isNotNil ]
		description: [ 'You can not access `left` if it does not exist. Check #hasLeft first!' ].
	
	^ left
]

{ #category : 'accessing' }
TbSelectionNode >> left: aTextSelectionNode [
	self
		assert: [ aTextSelectionNode isNotNil ]
		description: [ 'aTextSelectionNode must not be nil' ].
	
	left := aTextSelectionNode
]

{ #category : 'tree - searching' }
TbSelectionNode >> overlapping: aMonotoneTextSelection in: aStream [
	
	(left isNotNil and: [ aMonotoneTextSelection from <= left high ])
		ifTrue: [ left overlapping: aMonotoneTextSelection in: aStream ].

	(self selection overlaps: aMonotoneTextSelection)
		ifTrue: [ aStream nextPut: self ].

	(right isNotNil and: [ aMonotoneTextSelection from <= right high ])
		ifTrue: [ right overlapping: aMonotoneTextSelection in: aStream ]
]

{ #category : 'tree - searching' }
TbSelectionNode >> overlappingNeighbours: aMonotoneTextSelection in: aStream [
	
	(left isNotNil and: [ aMonotoneTextSelection from <= (left high + 1) ])
		ifTrue: [ left overlappingNeighbours: aMonotoneTextSelection in: aStream ].

	((self selection overlaps: aMonotoneTextSelection) or: [ self selection neighbours: aMonotoneTextSelection ])
		ifTrue: [ aStream nextPut: self ].

	(right isNotNil and: [ aMonotoneTextSelection from <= (right high + 1) ])
		ifTrue: [ right overlappingNeighbours: aMonotoneTextSelection in: aStream ]
]

{ #category : 'accessing' }
TbSelectionNode >> parent [
	self
		assert: [ parent isNotNil ]
		description: [ 'You can not access `parent` if it does not exist. Check #hasParent first!' ].
		
	^ parent
]

{ #category : 'accessing' }
TbSelectionNode >> parent: aBlSelectionNode [
	parent := aBlSelectionNode
]

{ #category : 'printing' }
TbSelectionNode >> printOn: aStream [

	self hasLeft ifTrue: [ self left printOn: aStream ].
	self selection printOn: aStream.
	self hasRight ifTrue: [ self right printOn: aStream ].
]

{ #category : 'tree - deletion' }
TbSelectionNode >> removeLeft [
	left := nil
]

{ #category : 'tree - deletion' }
TbSelectionNode >> removeRight [
	right := nil
]

{ #category : 'tree - deletion' }
TbSelectionNode >> replaceInParent: aTextSelectionNode [
	"Replace me in a parent with a given node"
	
	self
		assert: [ aTextSelectionNode isNotNil ]
		description: [ 'aTextSelectionNode must not be nil!' ].
	
	(self hasParent and: [ self parent isRoot not ])
		ifTrue: [			
			(self parent hasLeft and: [ self parent left == self ])
				ifTrue: [ self parent left: aTextSelectionNode ].
			(self parent hasRight and: [ self parent right == self ])
				ifTrue: [ self parent right: aTextSelectionNode ] ].
	
	(self hasParent and: [ self parent isRoot ])
		ifTrue: [ self parent root: aTextSelectionNode ].
	
	aTextSelectionNode parent: self parent.
	"I am replaced and don't have a parent anymore"
	parent := nil
]

{ #category : 'tree - enumerating' }
TbSelectionNode >> reverseDo: aBlock [

	self hasRight
		ifTrue: [ self right reverseDo: aBlock ].
	
	aBlock value: self selection.
	
	self hasLeft
		ifTrue: [ self left reverseDo: aBlock ]
]

{ #category : 'accessing' }
TbSelectionNode >> right [
	self
		assert: [ right isNotNil ]
		description: [ 'You can not access `right` if it does not exist. Check #hasRight first!' ].
	
	^ right
]

{ #category : 'accessing' }
TbSelectionNode >> right: aTextSelectionNode [
	self
		assert: [ aTextSelectionNode isNotNil ]
		description: [ 'aTextSelectionNode must not be nil' ].
	
	right := aTextSelectionNode
]

{ #category : 'accessing' }
TbSelectionNode >> selection [
	^ selection
]

{ #category : 'initialization' }
TbSelectionNode >> selection: aMonotoneTextSelection [
	selection := aMonotoneTextSelection.
	high := selection to
]
