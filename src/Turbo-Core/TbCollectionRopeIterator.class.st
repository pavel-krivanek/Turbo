"
I am a special iterator used to iterate over collection rope
"
Class {
	#name : #TbCollectionRopeIterator,
	#superclass : #TbRopeIterator,
	#instVars : [
		'position'
	],
	#category : #'Turbo-Core-DataStructure - Rope'
}

{ #category : #'private - asserting' }
TbCollectionRopeIterator >> assertInvariant [
	"I am a position invariant; I make sure that iterator operations do not go out of bounds"

	(position >= start)
		ifFalse: [ self error: 'Position must always be greater or equal than start' ].

	(position <= end)
		ifFalse: [ self error: 'Position must always be less or equal than end' ].
]

{ #category : #'iterator - attributes' }
TbCollectionRopeIterator >> attributes [
	^ #()
]

{ #category : #'iterator - testing' }
TbCollectionRopeIterator >> hasNext [
	<return: #Boolean>
	self assertInvariant.

	^ position < end
]

{ #category : #'iterator - testing' }
TbCollectionRopeIterator >> hasPrevious [
	<return: #Boolean>
	self assertInvariant.

	^ position > start
]

{ #category : #'iterator - enumeration' }
TbCollectionRopeIterator >> next [
	<return: #Object>
	
	self hasNext
		ifFalse: [ self errorReachedTheEnd ].
	
	^ rope at: (position := position + 1)
]

{ #category : #'iterator - enumeration' }
TbCollectionRopeIterator >> nextSpan [
	<return: #BlRope>
	| aSpan |

	self hasNext
		ifFalse: [ self errorReachedTheEnd ].

	aSpan := rope from: position to: end.
	position := end.

	^ aSpan
]

{ #category : #'iterator - enumeration' }
TbCollectionRopeIterator >> peek [
	<return: #Object>

	self hasNext
		ifFalse: [ self errorReachedTheEnd ].

	^ rope at: position + 1
]

{ #category : #'as yet unclassified' }
TbCollectionRopeIterator >> peer [
	<return: #Object>

	self hasPrevious
		ifFalse: [ self errorReachedTheStart ].

	^ rope at: position
]

{ #category : #'iterator - accessing' }
TbCollectionRopeIterator >> position [
	<return: #Number>

	^ position
]

{ #category : #'iterator - enumeration' }
TbCollectionRopeIterator >> previous [
	<return: #Object>
	| anItem |

	self hasPrevious
		ifFalse: [ self errorReachedTheStart ].
	
	anItem := rope at: position.
	position := position - 1.

	^ anItem
]

{ #category : #'instance creation' }
TbCollectionRopeIterator >> rope: aRope from: aStart to: anEnd [
	super rope: aRope from: aStart to: anEnd.

	position := aStart.
	self assertInvariant
]

{ #category : #'iterator - enumeration' }
TbCollectionRopeIterator >> skip: aNumber [
	| newPosition |
	
	newPosition := position + aNumber.
	
	newPosition <= end
		ifFalse: [ self errorOvershootsTheEnd ].
		
	newPosition >= start
		ifFalse: [ self errorOvershootsTheStart ].

	position := newPosition
]
