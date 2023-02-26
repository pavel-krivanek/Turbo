"
I a special type of rope used to represent a sub rope for the case when rebuilding the whole binary tree does not make since, so I just decorate an original rope limiting its access by using an offset and allowed length
"
Class {
	#name : #TbSubRope,
	#superclass : #TbRope,
	#instVars : [
		'rope',
		'offset',
		'length'
	],
	#category : #'Turbo-Core-DataStructure - Rope'
}

{ #category : #'instance creation' }
TbSubRope class >> combineScoped: aLeftRope and: aRightRope [
	^ self
		rope: aLeftRope rope
		offset: aLeftRope offset
		length: aLeftRope size + aRightRope size
]

{ #category : #'instance creation' }
TbSubRope class >> rope: aRope offset: anOffset length: aLength [
	^ self new
		rope: aRope offset: anOffset length: aLength;
		yourself
]

{ #category : #'rope - accessing' }
TbSubRope >> at: anIndex [
	anIndex > length
		ifTrue: [ self error: 'Sub rope index out of bounds: ', anIndex asString ].
	
	^ rope at: offset + anIndex
]

{ #category : #'rope - attributes' }
TbSubRope >> attributes: anAttributesCollection from: aStart to: anEnd [
	"See BlRope>>#attributes:from:to: for the detailed explanation on start and end indices"
	<return: #BlRope>
	| anAttributeRope |

	self assertAccessFrom: aStart to: anEnd.

	anAttributesCollection
		ifEmpty: [ ^ self ].

	anAttributeRope := self class attributeRope
		attributes: anAttributesCollection
		rope: (self from: aStart to: anEnd).

	"attributes are applied on the whole rope, return it"
	(aStart = 0 and: [ anEnd = self size ])
		ifTrue: [ ^ anAttributeRope ].

	aStart = 0
		ifTrue: [ ^ anAttributeRope append: (self from: anEnd to: self size) ].

	anEnd = self size
		ifTrue: [ ^ (self from: 0 to: aStart) append: anAttributeRope ].

	^  (self from: 0 to: aStart) append: (anAttributeRope append: (self from: anEnd to: self size))
]

{ #category : #'rope - accessing' }
TbSubRope >> children [
	^ { rope }
]

{ #category : #'rope - attributes' }
TbSubRope >> clearAttributes: aStart to: anEnd if: aBlock [
	<return: #BlRope>
	| anClearedRope |
	self assertAccessFrom: aStart to: anEnd.

	anClearedRope := self rope clearAttributes: aStart + offset to: anEnd + offset if: aBlock.
	^ anClearedRope from: offset to: offset + length
]

{ #category : #'rope - deleting' }
TbSubRope >> delete: aStart to: anEnd [
	<return: #BlRope>
	| afterDeletion |

	self assertAccessFrom: aStart to: anEnd.
	
	aStart == anEnd
		ifTrue: [ ^ self ].
		
	(aStart = 0 and: [ anEnd = self size ])
		ifTrue: [ ^ self empty ].

	afterDeletion := self rope delete: aStart + offset to: anEnd + offset.
	^ afterDeletion
		from: offset
		to: offset + length - (anEnd - aStart)
]

{ #category : #'rope - accessing' }
TbSubRope >> depth [
	<return: #Number>

	^ rope depth
]

{ #category : #'rope - enumeration' }
TbSubRope >> empty [
	"I delegate creation to the rope which I constrain"
	<return: #BlRope>

	^ self rope empty
]

{ #category : #accessing }
TbSubRope >> end [
	<return: #Number>

	^ self start + self size
]

{ #category : #'rope - accessing' }
TbSubRope >> from: aStart to: anEnd [
	<return: #BlRope>
	self assertAccessFrom: aStart to: anEnd.
	
	(aStart = 0 and: [ anEnd = self size ])
		ifTrue: [ ^ self ].
		
	(aStart = anEnd)
		ifTrue: [ ^ self rope from: offset + aStart to: offset + anEnd ].

	^ self class subRope
		rope: self rope
		offset: offset + aStart
		length: anEnd - aStart
]

{ #category : #'rope - enumeration' }
TbSubRope >> from: aStart to: anEnd do: aBlock [
	self rope from: aStart + offset to: anEnd + offset do: aBlock
]

{ #category : #'rope - inserting' }
TbSubRope >> insertItems: aCollection at: anIndex [
	<return: #BlRope>
	| afterInsertion |
	self assertIndexForInsert: anIndex.

	afterInsertion := self rope insertItems: aCollection at: anIndex + offset.
	^ afterInsertion from: offset to: offset + length + aCollection size
]

{ #category : #'rope - testing' }
TbSubRope >> isLeaf [
	<return: #Boolean>

	^ false
]

{ #category : #'rope - testing' }
TbSubRope >> isScoped [
	<return: #Boolean>

	^ true
]

{ #category : #'rope - enumeration' }
TbSubRope >> iterator: aStart to: anEnd [
	^ TbSubRopeIterator rope: self from: aStart to: anEnd
]

{ #category : #accessing }
TbSubRope >> offset [
	<return: #Number>

	^ offset
]

{ #category : #accessing }
TbSubRope >> rope [
	<return: #BlRope>

	^ rope
]

{ #category : #initialization }
TbSubRope >> rope: aRope offset: anOffset length: aLength [

	anOffset < 0
		ifTrue: [ self error: 'Negative offset: ', anOffset asString ].
	aLength < 0
		ifTrue: [ self error: 'Negative length: ', aLength asString ].
	(aLength + anOffset) > aRope size
		ifTrue: [ self error: 'Illegal offset (', anOffset asString,') and length (',aLength asString,') combination for sub rope of length ', aRope size asString ].

	rope := aRope.
	offset := anOffset.
	length := aLength
]

{ #category : #'rope - accessing' }
TbSubRope >> size [
	<return: #Number>

	^ length
]

{ #category : #accessing }
TbSubRope >> start [
	<return: #Number>
	
	^ self offset
]
