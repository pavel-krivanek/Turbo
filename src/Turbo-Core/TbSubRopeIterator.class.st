"
I am a special iterator used to iterate over sub-rope
"
Class {
	#name : 'TbSubRopeIterator',
	#superclass : 'TbRopeIterator',
	#instVars : [
		'subIterator'
	],
	#category : 'Turbo-Core-DataStructure - Rope',
	#package : 'Turbo-Core',
	#tag : 'DataStructure - Rope'
}

{ #category : 'iterator - accessing' }
TbSubRopeIterator >> attributes [
	^ subIterator attributes
]

{ #category : 'iterator - testing' }
TbSubRopeIterator >> hasNext [
	^ subIterator hasNext
]

{ #category : 'accessing' }
TbSubRopeIterator >> hasPrevious [
	^ subIterator hasPrevious
]

{ #category : 'iterator - enumeration' }
TbSubRopeIterator >> next [
	^ subIterator next
]

{ #category : 'iterator - enumeration' }
TbSubRopeIterator >> nextSpan [
	^ subIterator nextSpan
]

{ #category : 'iterator - enumeration' }
TbSubRopeIterator >> peek [
	^ subIterator peek
]

{ #category : 'iterator - enumeration' }
TbSubRopeIterator >> peer [
	^ subIterator peer
]

{ #category : 'iterator - accessing' }
TbSubRopeIterator >> position [
	^ subIterator position - rope offset
]

{ #category : 'iterator - enumeration' }
TbSubRopeIterator >> previous [
	^ subIterator previous
]

{ #category : 'instance creation' }
TbSubRopeIterator >> rope: aRope from: aStart to: anEnd [
	super rope: aRope from: aStart to: anEnd.
	subIterator := aRope rope iterator: aStart + aRope offset to: anEnd + aRope offset
]

{ #category : 'iterator - enumeration' }
TbSubRopeIterator >> skip: aNumber [
	subIterator skip: aNumber
]
