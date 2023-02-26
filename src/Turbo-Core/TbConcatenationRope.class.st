"
I am a special type of rope that plays a role of a node in a binary tree and contains left and right branch
"
Class {
	#name : #TbConcatenationRope,
	#superclass : #TbRope,
	#instVars : [
		'left',
		'right',
		'length'
	],
	#category : #'Turbo-Core-DataStructure - Rope'
}

{ #category : #'instance creation' }
TbConcatenationRope class >> left: aLeftRope right: aRightRope [
	^ self new
		left: aLeftRope right: aRightRope;
		yourself
]

{ #category : #'rope - accessing' }
TbConcatenationRope >> at: anIndex [
	| leftSize |
	
	leftSize := left size.

	^ anIndex <= leftSize
		ifTrue: [ left at: anIndex ]
		ifFalse: [ right at: anIndex - leftSize ]
]

{ #category : #'rope - attributes' }
TbConcatenationRope >> attributes: anAttributesCollection from: aStart to: anEnd [
	| leftSize newLeft newRight |

	self assertAccessFrom: aStart to: anEnd.
	
	anAttributesCollection
		ifEmpty: [ ^ self ].

	(aStart = 0 and: [ anEnd = self size ])
		ifTrue: [ ^ self class attributeRope
			attributes: anAttributesCollection
			rope: self ].

	leftSize := left size.
	newLeft := nil.
	newRight := nil.

	newLeft := anEnd <= leftSize
		ifTrue: [ left attributes: anAttributesCollection from: aStart to: anEnd ]
		ifFalse: [ aStart < leftSize
			ifTrue: [ left attributes: anAttributesCollection from: aStart to: leftSize ]
			ifFalse: [ left ] ].

	newRight := aStart >= leftSize
		ifTrue: [ right attributes: anAttributesCollection from: aStart - leftSize to: anEnd - leftSize ]
		ifFalse: [ anEnd > leftSize
			ifTrue: [ right attributes: anAttributesCollection from: 0 to: anEnd - leftSize ]
			ifFalse: [ right ] ].
		
	^ self class
		concatenate: newLeft
		and: newRight
]

{ #category : #'rope - accessing' }
TbConcatenationRope >> children [
	^ { left . right }
]

{ #category : #'rope - attributes' }
TbConcatenationRope >> clearAttributes: aStart to: anEnd if: aBlock [
	| leftSize newLeft newRight |
	
	self assertAccessFrom: aStart to: anEnd.
	
	(aStart = 0 and: [ anEnd = self size ])
		ifTrue: [ ^ self class
			concatenate: (left clearAttributes: 0 to: left size if: aBlock)
			and: (right clearAttributes: 0 to: right size if: aBlock) ].

	leftSize := left size.
	newLeft := nil.
	newRight := nil.

	newLeft := anEnd <= leftSize
		ifTrue: [ left clearAttributes: aStart to: anEnd if: aBlock ]
		ifFalse: [ aStart < leftSize
			ifTrue: [ left clearAttributes: aStart to: leftSize if: aBlock ]
			ifFalse: [ left ] ].

	newRight := aStart >= leftSize
		ifTrue: [ right clearAttributes: aStart - leftSize to: anEnd - leftSize if: aBlock ]
		ifFalse: [ anEnd > leftSize
			ifTrue: [ right clearAttributes: 0 to: anEnd - leftSize if: aBlock ]
			ifFalse: [ right ] ].

	^ self class
		concatenate: newLeft
		and: newRight
]

{ #category : #'rope - deleting' }
TbConcatenationRope >> delete: aStart to: anEnd [
	self assertAccessFrom: aStart to: anEnd.

	"We remove the whole left side, just return the right one"
	(aStart = 0 and: [ anEnd = left size ])
		ifTrue: [ ^ right ].
		
	"We remove the whole right side, just return the left one"
	(aStart = left size and: [ anEnd = self size ])
		ifTrue: [ ^ left ].

	^ (aStart > 0 and: [ anEnd < self size ])
		ifTrue: [
			self class
				concatenate: (self from: 0 to: aStart)
				and: (self from: anEnd to: self size) ]
		ifFalse: [
			(aStart = 0 and: [ anEnd = self size ])
				ifTrue: [ self empty ]
				ifFalse: [ aStart = 0
					ifTrue: [ self from: anEnd to: self size ]
					ifFalse: [ self from: 0 to: aStart ] ] ]
]

{ #category : #'rope - accessing' }
TbConcatenationRope >> depth [
	<return: #Number>

	^ (left depth max: right depth) + 1
]

{ #category : #'rope - enumeration' }
TbConcatenationRope >> do: aBlock [
	left do: aBlock.
	right do: aBlock
]

{ #category : #'rope - accessing' }
TbConcatenationRope >> empty [
	"Create and return an empty version of this rope"
	<return: #BlRope>
	
	^ self left empty
]

{ #category : #'rope - accessing' }
TbConcatenationRope >> from: aStart to: anEnd [
	| leftSize |

	self assertAccessFrom: aStart to: anEnd.

	(aStart = 0 and: [ anEnd = self size ])
		ifTrue: [ ^ self ].

	leftSize := left size.
	anEnd <= leftSize
		ifTrue: [ ^ left from: aStart to: anEnd ].

	aStart >= leftSize
		ifTrue: [ ^ right from: aStart - leftSize to: anEnd - leftSize ].

	^ self class
		concatenate: (left from: aStart to: leftSize)
		and: (right from: 0 to: anEnd - leftSize)
]

{ #category : #'rope - enumeration' }
TbConcatenationRope >> from: aStart to: anEnd do: aBlock [
	| leftSize isReversed |
	
	self assertAccessFrom: aStart to: anEnd.
	
	leftSize := left size.
	isReversed := anEnd < aStart.
	
	isReversed
		ifTrue: [
			aStart > leftSize
				ifTrue: [ right from: aStart - leftSize to: (anEnd max: leftSize + 1) - leftSize do: aBlock ].
			anEnd <= leftSize
				ifTrue: [ left from: (aStart min: leftSize) to: anEnd do: aBlock ] ]
		ifFalse: [ 
			aStart < leftSize
				ifTrue: [ left from: aStart to: (anEnd min: leftSize) do: aBlock ].
			anEnd > leftSize
				ifTrue: [ right from: ((aStart - leftSize) max: 0) to: anEnd - leftSize do: aBlock ] ]
]

{ #category : #'rope - inserting' }
TbConcatenationRope >> insertItems: aCollection at: anIndex [
	| leftSize aNewLeft aNewRight |
	self assertIndexForInsert: anIndex.

	leftSize := left size.
	aNewLeft := left.
	aNewRight := right.
	
	anIndex <= leftSize
		ifTrue: [ aNewLeft := left insertItems: aCollection at: anIndex ].
	
	anIndex > leftSize
		ifTrue: [ aNewRight := right insertItems: aCollection at: anIndex - leftSize ].

	^ self class concatenate: aNewLeft and: aNewRight
]

{ #category : #'rope - testing' }
TbConcatenationRope >> isConcatenation [
	^ true
]

{ #category : #'rope - testing' }
TbConcatenationRope >> isLeaf [
	^ false
]

{ #category : #'rope - enumeration' }
TbConcatenationRope >> iterator: aStart to: anEnd [
	^ TbConcatenationRopeIterator rope: self from: aStart to: anEnd
]

{ #category : #accessing }
TbConcatenationRope >> left [
	<return: #BlRope>

	^ left
]

{ #category : #initialization }
TbConcatenationRope >> left: aLeftRope right: aRightRope [
	left := aLeftRope.
	right := aRightRope.
	length := left size + right size
]

{ #category : #accessing }
TbConcatenationRope >> right [
	<return: #BlRope>

	^ right
]

{ #category : #'rope - accessing' }
TbConcatenationRope >> size [
	^ length
]
