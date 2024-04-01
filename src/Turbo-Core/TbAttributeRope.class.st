"
I am a special type of rope that can contain a set of attributes.
I am able to add attributes to any type of rope by decorating it with attribute rope, it means that I am not a leaf rope
"
Class {
	#name : #TbAttributeRope,
	#superclass : #TbRope,
	#instVars : [
		'attributes',
		'rope'
	],
	#category : #'Turbo-Core-DataStructure - Rope'
}

{ #category : #initialization }
TbAttributeRope class >> attributes: anAttributeCollection rope: aRope [
	| aMergedCollection aMergedRope |
	
	aMergedCollection := aRope isAttributed
		ifTrue: [ self mergeAttributes: aRope attributes and: anAttributeCollection ]
		ifFalse: [ anAttributeCollection ].
		
	aMergedRope := aRope isAttributed
		ifTrue: [ aRope rope ]
		ifFalse: [ aRope ].

	^ self new
		attributes: aMergedCollection rope: aMergedRope;
		yourself
]

{ #category : #utilities }
TbAttributeRope class >> combineAttributed: aLeftAttributeRope and: aRightAttributeRope [
	<return: #BlRope>

	^ self
		attributes: aLeftAttributeRope attributes
		rope: (self concatenate: aLeftAttributeRope rope and: aRightAttributeRope rope)
]

{ #category : #utilities }
TbAttributeRope class >> mergeAttributes: aCollectionOfAttributes and: anotherCollectionOfAttributes [
	"Merge two collection of attributes letting anotherCollectionOfAttributes to override
	attributes from aCollectionOfAttributes based on its type"
	<return: #Collection of: #Object>
	| anOrderedDictionary |
	
	((aCollectionOfAttributes isKindOf: HashedCollection) or: [ anotherCollectionOfAttributes isKindOf: HashedCollection ])
		ifTrue: [ self notify: 'Hashed collection is unordered, so the order of attributes will be ignored!' ].
	
	anOrderedDictionary := OrderedDictionary new.

	anotherCollectionOfAttributes reverseDo: [ :each | anOrderedDictionary at: each put: each ].
	aCollectionOfAttributes reverseDo: [ :each | anOrderedDictionary at: each put: each ].

	^ Array streamContents: [ :aStream | anOrderedDictionary keys reverseDo: [ :anObject | aStream nextPut: anObject ] ]
]

{ #category : #utilities }
TbAttributeRope class >> removeDuplicates: aCollection [
	"Remove duplicates from a given collection preserving the original order"
	<return: #Collection of: #Object>
	| anOrderedDictionary |
	
	(aCollection isKindOf: HashedCollection)
		ifTrue: [ self notify: 'Hashed collection is unordered, so the order of attributes will be ignored!' ].
	
	anOrderedDictionary := OrderedDictionary new.
	aCollection reverseDo: [ :each | anOrderedDictionary at: each put: each ].

	^ Array streamContents: [ :aStream | anOrderedDictionary keys reverseDo: [ :anObject | aStream nextPut: anObject ] ]
]

{ #category : #'rope - accessing' }
TbAttributeRope >> at: anIndex [
	^ rope at: anIndex
]

{ #category : #accessing }
TbAttributeRope >> attributes [
	<return: #Collection of: #Object>

	^ attributes
]

{ #category : #'rope - attributes' }
TbAttributeRope >> attributes: anAttributesCollection from: aStart to: anEnd [
	| anAttributeRope |
	self assertAccessFrom: aStart to: anEnd.

	anAttributesCollection
		ifEmpty: [ ^ self ].
	
	anAttributeRope := (self rope from: aStart to: anEnd)
		attributes: (self class mergeAttributes: self attributes and: anAttributesCollection)
		from: 0
		to: (anEnd - aStart).

	(aStart = 0 and: [ anEnd = self size ])
		ifTrue: [ ^ anAttributeRope ].

	aStart = 0 ifTrue: [ 
		^ self class
			concatenate: anAttributeRope
			and: (self from: anEnd to: self size) ].
	
	anEnd = self size ifTrue: [ 
		^ self class
			concatenate: (self from: 0 to: aStart)
			and: anAttributeRope ].

	^ (self from: 0 to: aStart) append: (anAttributeRope append: (self from: anEnd to: self size))
]

{ #category : #initialization }
TbAttributeRope >> attributes: theAttributes rope: aRope [

	(theAttributes isKindOf: HashedCollection)
		ifTrue: [ self notify: 'Hashed collection is unordered, so the order of attributes will be ignored!' ].

	attributes := self class removeDuplicates: theAttributes.
	rope := aRope
]

{ #category : #'rope - accessing' }
TbAttributeRope >> children [
	^ { rope }
]

{ #category : #'rope - attributes' }
TbAttributeRope >> clearAttributes: aStart to: anEnd if: aBlock [
	| aSubRope aClearedRope preservedAttributes  |
	self assertAccessFrom: aStart to: anEnd.

	preservedAttributes := self attributes reject: [ :anAssociation | aBlock value: anAssociation value ].

	aSubRope := self rope from: aStart to: anEnd.
	
	aClearedRope := aSubRope
		clearAttributes: 0
		to: aSubRope size
		if: aBlock.

	preservedAttributes ifNotEmpty: [ :theAttributes | aClearedRope := aClearedRope attributes: theAttributes ].

	(aStart = 0 and: [ anEnd = self size ])
		ifTrue: [ ^ aClearedRope ].

	aStart = 0 ifTrue: [ 
		^ self class
			concatenate: aClearedRope
			and: (self from: anEnd to: self size) ].
	
	anEnd = self size ifTrue: [ 
		^ self class
			concatenate: (self from: 0 to: aStart)
			and: aClearedRope ].

	^ (self from: 0 to: aStart) append: (aClearedRope append: (self from: anEnd to: self size))
]

{ #category : #'rope - deleting' }
TbAttributeRope >> delete: aStart to: anEnd [
	<return: #BlRope>
	self assertAccessFrom: aStart to: anEnd.

	aStart = anEnd
		ifTrue: [ ^ self ].

	^ self class attributeRope
		attributes: attributes
		rope: (rope delete: aStart to: anEnd)
]

{ #category : #'rope - accessing' }
TbAttributeRope >> depth [
	^ rope depth
]

{ #category : #'rope - enumeration' }
TbAttributeRope >> do: aBlock [
	self rope do: aBlock
]

{ #category : #'rope - accessing' }
TbAttributeRope >> empty [
	"Create and return an empty version of this rope"
	<return: #BlRope>
	
	^ self class
		attributes: self attributes
		rope: self rope empty
]

{ #category : #'rope - accessing' }
TbAttributeRope >> from: aStart to: anEnd [
	<return: #BlRope>

	self assertAccessFrom: aStart to: anEnd.

	(aStart = anEnd)
		ifTrue: [ ^ self empty ].

	(aStart = 0 and: [ anEnd = self size ])
		ifTrue: [ ^ self ].

	^ self class attributeRope
		attributes: attributes
		rope: (rope from: aStart to: anEnd)
]

{ #category : #'rope - enumeration' }
TbAttributeRope >> from: aStart to: anEnd do: aBlock [
	self rope from: aStart to: anEnd do: aBlock
]

{ #category : #'rope - inserting' }
TbAttributeRope >> insertItems: aCollection at: anIndex [

	^ self class attributeRope
		attributes: attributes
		rope: (rope insertItems: aCollection at: anIndex)
]

{ #category : #'rope - testing' }
TbAttributeRope >> isAttributed [
	<return: #Boolean>
	
	^ true
]

{ #category : #'rope - testing' }
TbAttributeRope >> isEmpty [
	"Attribute rope is empty then and only then when attributes and underlying rope are empty"
	<return: #Boolean>

	^ self attributes isEmpty and: [ self rope isEmpty ]
]

{ #category : #'rope - testing' }
TbAttributeRope >> isLeaf [
	^ false
]

{ #category : #'rope - enumeration' }
TbAttributeRope >> iterator: aStart to: anEnd [
	^ TbAttributeRopeIterator rope: self from: aStart to: anEnd
]

{ #category : #accessing }
TbAttributeRope >> rope [
	^ rope
]

{ #category : #'rope - accessing' }
TbAttributeRope >> size [
	^ rope size
]
