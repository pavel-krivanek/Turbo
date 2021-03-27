"
Rope is a data structure for storing text. It is an alternative to array or buffer-based data structures. A rope is a tree of concatenation nodes representing character strings. In addition to concatenation nodes, depending on implementation, a rope may include subset nodes, reverse nodes or other custom types of nodes. A rope allows text editors to manipulate large pieces of text and makes text operations such as random access, insertion and deletion very efficient. However, to maintain high efficiency a rope must be re-balanced otherwise it may lose its binary search tree properties and operations become inefficient.
If all operations are implemented in a non-destructive way, a rope becomes a persistent data structure. To enforce that, any modification should return a new node instance with applied changes. A root node of the returned rope, in this case, does not necessarily have the same type as the one that was modified. From a text editor perspective, persistence makes it easier to implement undo/redo commands and helps to prevent multithreading issues when it comes to text styling.

A rope is a binary tree having leaf nodes that contain a short string. Each node has a weight value equal to the length of its string plus the sum of all leaf nodes' weight in its left subtree, namely the weight of a node is the total string length in its left subtree for a non-leaf node, or the string length of itself for a leaf node. Thus a node with two children divides the whole string into two parts: the left subtree stores the first part of the string. The right subtree stores the second part and its weight is the sum of the left child's weight and the length of its contained string.
The binary tree can be seen as several levels of nodes. The bottom level contains all the nodes that contain a string. Higher levels have fewer and fewer nodes. The top level consists of a single ""root"" node. The rope is built by putting the nodes with short strings in the bottom level, then attaching a random half of the nodes to parent nodes in the next level.

I can be enumerated with the help of ${class:BlRopeIterator}$.

https://en.wikipedia.org/wiki/Rope_(data_structure)


"
Class {
	#name : #TbRope,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : #'Turbo-Core-DataStructure - Rope'
}

{ #category : #types }
TbRope class >> attributeRope [
	^ BlAttributeRope
]

{ #category : #types }
TbRope class >> collectionRope [
	^ BlCollectionRope
]

{ #category : #accessing }
TbRope class >> combineLength [
	^ 32
]

{ #category : #rope }
TbRope class >> concatenate: aLeftRope and: aRightRope [
	| totalSize |
	
	self
		assert: [ (aLeftRope isEmpty and: [ aRightRope isEmpty  ]) not ]
		description: [ 'Can not concatenate two empty ropes' ].
	
	aLeftRope isEmpty
		ifTrue: [ ^ aRightRope ].

	aRightRope isEmpty 
		ifTrue: [ ^ aLeftRope ].

	totalSize := aLeftRope size + aRightRope size.
	
	"if both ropes are leafs we can simplify concatenation by merging them if combined length is small"
	(aLeftRope isLeaf and: [ aRightRope isLeaf and: [ totalSize <= self combineLength ] ])
		ifTrue: [ ^ self collectionRope from: aLeftRope and: aRightRope ].
		
	"if both are attribute ropes we can extract common attributes and merge smartly"
	(aLeftRope isAttributed and: [ aRightRope isAttributed and: [ aLeftRope attributes = aRightRope attributes ] ])
		ifTrue: [ ^ self attributeRope combineAttributed: aLeftRope and: aRightRope ].
		
	"if both are scoped ropes and represent a sequence they can be merged in one scoped rope"
	(aLeftRope isScoped and: [ aRightRope isScoped and: [ aLeftRope rope == aRightRope rope and: [ aLeftRope end = aRightRope start ] ] ])
		ifTrue: [ ^ self subRope combineScoped: aLeftRope and: aRightRope ].

	"balancing magic :) if the length of the left or right is twice as large as the other one"
	((aLeftRope size + aRightRope size > (self combineLength))
		and: [ ((aLeftRope size * 2) < aRightRope size)
			or: [ aLeftRope size > (aRightRope size * 2) ] ])
		ifTrue: [ 
			| aMiddle |
			aMiddle := ((aLeftRope size + aRightRope size) / 2.0) floor asInteger - (aLeftRope size min: aRightRope size).
			
			^ aLeftRope size > aRightRope size
				ifTrue: [
					self concatenationRope
						left: (aLeftRope from: 0 to: aMiddle)
						right: ((aLeftRope from: aMiddle to: aLeftRope size) append: aRightRope ) ]
				ifFalse: [
					self concatenationRope
						left: (aLeftRope append: (aRightRope from: 0 to: aMiddle))
						right: (aRightRope from: aMiddle to: aRightRope size) ] ].
	
	^ self concatenationRope
		left: aLeftRope
		right: aRightRope
]

{ #category : #types }
TbRope class >> concatenationRope [
	^ BlConcatenationRope
]

{ #category : #types }
TbRope class >> subRope [
	^ BlSubRope
]

{ #category : #'rope - accessing' }
TbRope >> allChildrenBreadthFirstDo: aBlock [ 
	self children do: aBlock.
	self children do: [ :eachRope | eachRope allChildrenBreadthFirstDo: aBlock ]
]

{ #category : #'rope - accessing' }
TbRope >> append: aRope [
	"Create and return a new rope by append a given rope to the of end of me"
	<return: #BlRope>

	^ self class concatenate: self and: aRope
]

{ #category : #converting }
TbRope >> asString [
	^ self printStringLimitedTo: Float infinity
]

{ #category : #'private - asserting' }
TbRope >> assertAccessFrom: aStartIndex to: anEndIndex [
	"I am an index invariant; I make sure that rope operation that require
	access by index do not go out of rope bounds"

	(aStartIndex <= anEndIndex)
		ifFalse: [ self error: 'Start index must be less or equal to an end index' ].

	(aStartIndex >= 0)
		ifFalse: [ self error: 'Start index must not be negative' ].

	(anEndIndex <= self size)
		ifFalse: [ self error: 'End index must be less or equal than the rope size' ]
]

{ #category : #'private - asserting' }
TbRope >> assertIndexForInsert: anIndex [
	"I am an insertion index invariant; I make sure that insertion operations
	do not go out of rope bounds"
	
	(anIndex < 0 or: [ anIndex > self size ])
		ifTrue: [ self error: 'Insert index ', anIndex asString, ' is out of bounds' ]
]

{ #category : #'rope - accessing' }
TbRope >> at: anIndex [
	"Return an item at an given index"
	<return: #Object>

	^ self subclassResponsibility
]

{ #category : #'rope - attributes' }
TbRope >> attributes: anAttributesCollection [
	^ self attributes: anAttributesCollection from: 0 to: self size
]

{ #category : #'rope - attributes' }
TbRope >> attributes: anAttributesCollection from: aStart to: anEnd [
	"Apply a given collection of attributes on the interval specified by aStart and anEnd indices.
	aStart and anEnd are given in `cursor` coordinates. For example, assume we have the following text:

	 H E L L O
	^ ^ ^ ^ ^ ^
	0 1 2 3 4 5

	In order to set attributes on the whole rope we should apply them from 0 (index before the first item) to 5 (index after the last item).
	To only apply attributes on the letter E we should set them from 1 to 2"

	^ self subclassResponsibility
]

{ #category : #'rope - accessing' }
TbRope >> children [
	"Return a collection of ropes that are my children"
	<return: #Collection of: #BlRope>

	^ {  }
]

{ #category : #'rope - attributes' }
TbRope >> clearAttributes: aStart to: anEnd [
	"Clear all attributes"

	^ self clearAttributes: aStart to: anEnd if: [ :each | true ]
]

{ #category : #'rope - attributes' }
TbRope >> clearAttributes: aStart to: anEnd if: aBlock [
	^ self subclassResponsibility
]

{ #category : #'rope - deleting' }
TbRope >> delete: aStart to: anEnd [
	self subclassResponsibility
]

{ #category : #'rope - accessing' }
TbRope >> depth [
	"Return the max tree height of this rope (composition depth)"
	<return: #Number>

	^ self subclassResponsibility
]

{ #category : #'rope - enumeration' }
TbRope >> do: aBlock [
	self from: 0 to: self size do: aBlock
]

{ #category : #'rope - enumeration' }
TbRope >> empty [
	"Create and return an empty version of this rope"
	<return: #BlRope>
	
	^ self subclassResponsibility
]

{ #category : #'rope - accessing' }
TbRope >> from: aStart to: anEnd [
	<return: #BlRope>

	^ self subclassResponsibility
]

{ #category : #'rope - enumeration' }
TbRope >> from: aStart to: anEnd do: aBlock [
	self subclassResponsibility
]

{ #category : #'rope - inserting' }
TbRope >> insert: aRope at: anIndex [
	"Insert aRope after anIndex"
	anIndex = 0
		ifTrue: [ ^ aRope append: self ].

	anIndex = self size
		ifTrue: [ ^ self append: aRope ].
		
	(anIndex < 0 or: [ anIndex > self size ])
		ifTrue: [ self error: 'Insert index ', anIndex asString, ' is out of bounds' ].

	^ ((self from: 1 to: anIndex) append: aRope) append: (self from: anIndex + 1 to: self size)
]

{ #category : #'rope - inserting' }
TbRope >> insertItems: aCollection at: anIndex [
	"Insert a given collection of items at a provided index.
	anIndex is given in `cursor` coordinates. For example, assume we have the following collection of characters:

	 H E L L O
	^ ^ ^ ^ ^ ^
	0 1 2 3 4 5

	To prepend "

	^ self subclassResponsibility
]

{ #category : #'rope - testing' }
TbRope >> isAttributed [
	"Return true if I am an attributed rope"
	<return: #Boolean>
	
	^ false
]

{ #category : #'rope - testing' }
TbRope >> isConcatenation [
	^ false
]

{ #category : #'rope - testing' }
TbRope >> isEmpty [
	"Return true if rope is empty, false otherwise"
	<return: #Boolean>

	^ self size isZero
]

{ #category : #'rope - testing' }
TbRope >> isLeaf [
	^ self subclassResponsibility
]

{ #category : #'rope - testing' }
TbRope >> isNotEmpty [
	"Return true if rope is not empty, false otherwise"
	<return: #Boolean>

	^ self isEmpty not
]

{ #category : #'rope - testing' }
TbRope >> isScoped [
	<return: #Boolean>
	
	^ false
]

{ #category : #'rope - enumeration' }
TbRope >> iterator [
	^ self iterator: 0 to: self size
]

{ #category : #'rope - enumeration' }
TbRope >> iterator: aStart to: anEnd [
	^ self subclassResponsibility
]

{ #category : #'rope - accessing' }
TbRope >> last [
	"Return the last item in the rope"
	<return: #Object>

	^ self at: self size
]

{ #category : #'rope - printing' }
TbRope >> printOn: aStream [
	
	self do: [ :anItem | anItem isCharacter
		ifTrue: [ aStream nextPut: anItem ]
		ifFalse: [ aStream nextPutAll: anItem asString ] ]
]

{ #category : #'rope - streaming' }
TbRope >> putOn: aStream [
	self putOn: aStream from: 0 to: self size
]

{ #category : #'rope - streaming' }
TbRope >> putOn: aStream from: aStart to: anEnd [
	self from: aStart to: anEnd do: [ :anItem | aStream nextPut: anItem ]
]

{ #category : #'rope - accessing' }
TbRope >> size [
	<return: #Number>

	^ self subclassResponsibility
]

{ #category : #'rope - accessing' }
TbRope >> withAllChildrenBreadthFirst [
	| all |
	all := OrderedCollection with: self.
	self allChildrenBreadthFirstDo: [ :x | all add: x ].
	^ all
]
