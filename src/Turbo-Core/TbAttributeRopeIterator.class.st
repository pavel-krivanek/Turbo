"
I am a special iterator used to iterate over attribute rope
"
Class {
	#name : 'TbAttributeRopeIterator',
	#superclass : 'TbRopeIterator',
	#instVars : [
		'subIterator'
	],
	#category : 'Turbo-Core-DataStructure - Rope',
	#package : 'Turbo-Core',
	#tag : 'DataStructure - Rope'
}

{ #category : 'iterator - attributes' }
TbAttributeRopeIterator >> attributes [
	"Return a collection of rope attributes at a current position without duplicates"
	<return: #Collection of: #Objects>

	^ TbAttributeRope
		mergeAttributes: subIterator attributes
		and: rope attributes
]

{ #category : 'iterator - testing' }
TbAttributeRopeIterator >> hasNext [
	^ subIterator hasNext
]

{ #category : 'iterator - testing' }
TbAttributeRopeIterator >> hasPrevious [
	^ subIterator hasPrevious
]

{ #category : 'iterator - enumeration' }
TbAttributeRopeIterator >> next [
	^ subIterator next
]

{ #category : 'iterator - enumeration' }
TbAttributeRopeIterator >> nextSpan [
	| aSpan theAttributes |

	theAttributes := rope attributes.
	aSpan := subIterator nextSpan. "span without my rope's attributes"
	aSpan == rope rope
		ifTrue: [ ^ rope ].

	^ aSpan attributes: theAttributes
]

{ #category : 'iterator - enumeration' }
TbAttributeRopeIterator >> peek [
	^ subIterator peek
]

{ #category : 'iterator - enumeration' }
TbAttributeRopeIterator >> peer [
	^ subIterator peer
]

{ #category : 'iterator - accessing' }
TbAttributeRopeIterator >> position [
	^ subIterator position
]

{ #category : 'iterator - enumeration' }
TbAttributeRopeIterator >> previous [
	^ subIterator previous
]

{ #category : 'instance creation' }
TbAttributeRopeIterator >> rope: aRope from: aStart to: anEnd [
	super rope: aRope from: aStart to: anEnd.

	subIterator := aRope rope iterator: aStart to: anEnd
]

{ #category : 'iterator - enumeration' }
TbAttributeRopeIterator >> skip: aNumber [
	subIterator skip: aNumber
]
