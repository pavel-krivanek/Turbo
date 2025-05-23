"
I define an API of a rope iterator.

It is highly recommended to use iterator to enumerate ropes, since it can be done in constant time.
I support forward and reverse directions of enumeration
"
Class {
	#name : 'TbRopeIterator',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'rope',
		'start',
		'end'
	],
	#category : 'Turbo-Core-DataStructure - Rope',
	#package : 'Turbo-Core',
	#tag : 'DataStructure - Rope'
}

{ #category : 'instance creation' }
TbRopeIterator class >> rope: aRope from: aStart to: anEnd [
	^ self new
		rope: aRope from: aStart to: anEnd;
		yourself
]

{ #category : 'iterator - attributes' }
TbRopeIterator >> attributes [
	"Return a collection of rope attributes at the current *peek* position without duplicates"
	<return: #Collection of: #Objects>

	^ self subclassResponsibility
]

{ #category : 'iterator - attributes' }
TbRopeIterator >> detectAttribute: aBlock ifFound: aFoundBlock ifNone: anExceptionBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	If some element evaluates aBlock to true, then cull this element into 
	foundBlock and answer the result of this evaluation. 
	If none evaluate to true, then evaluate exceptionBlock."
	<return: #BlTextAttribute or: #Object>

	^ self attributes
		detect: aBlock
		ifFound: aFoundBlock
		ifNone: anExceptionBlock
]

{ #category : 'private - accessing' }
TbRopeIterator >> end [
	<return: #Number>
	
	^ end
]

{ #category : 'private - errors' }
TbRopeIterator >> errorOvershootsTheEnd [
	self error: 'Overshoots the end of the iterator!'
]

{ #category : 'private - errors' }
TbRopeIterator >> errorOvershootsTheStart [
	self error: 'Reached the end of the rope iterator!'
]

{ #category : 'private - errors' }
TbRopeIterator >> errorReachedTheEnd [
	self error: 'Reached the end of the rope iterator!'
]

{ #category : 'private - errors' }
TbRopeIterator >> errorReachedTheStart [
	self error: 'Overshoots the start of the iterator!'
]

{ #category : 'iterator - testing' }
TbRopeIterator >> hasNext [
	"Return true if iterator is be able to return #next item in the rope, false otherwise"
	<return: #Boolean>

	^ self subclassResponsibility
]

{ #category : 'iterator - testing' }
TbRopeIterator >> hasPrevious [
	"Return true if iterator is be able to return #previous item in the rope, false otherwise"
	<return: #Boolean>

	^ self subclassResponsibility
]

{ #category : 'iterator - testing' }
TbRopeIterator >> isCarriageReturn: anItem [
	"Return true of given item represents a carriage return, false otherwise"
	<return: #Boolean>

	^ anItem = Character cr
]

{ #category : 'iterator - testing' }
TbRopeIterator >> isLineDelimiter: anItem [
	"Return true of given item represents a line delimiter symbol, false otherwise"
	<return: #Boolean>

	^ (self isCarriageReturn: anItem) or: [ self isLineFeed: anItem ]
]

{ #category : 'iterator - testing' }
TbRopeIterator >> isLineFeed: anItem [
	"Return true of given item represents a line feed, false otherwise"
	<return: #Boolean>

	^ anItem = Character lf
]

{ #category : 'iterator - testing' }
TbRopeIterator >> isNewLine: anItem [
	"Return true of given item represents a carriage return, false otherwise"
	<return: #Boolean>

	^ anItem = Character cr or: [ anItem = Character lf ]
]

{ #category : 'iterator - enumeration' }
TbRopeIterator >> next [
	"Return next element in the rope"
	<return: #Object>

	^ self subclassResponsibility
]

{ #category : 'iterator - enumeration' }
TbRopeIterator >> nextLine [
	"Return a next line without delimiters"
	<return: #BlRope>
	
	^ self nextLineIndicesDo: [ :aStart :anEnd :aLineEndWithDelimiters | self rope from: aStart to: anEnd ]
]

{ #category : 'iterator - enumeration' }
TbRopeIterator >> nextLineIndicesDo: anIndicesBlock [
	" execute anIndicesBlock with 3 arguments for each line:
		- start index of line
		- end index of line without line delimiter
		- end index of line including line delimiter(s) CR, LF or CRLF"
	| aLineStart aLineEnd aLineSeparator |

	self hasNext
		ifFalse: [ self errorReachedTheEnd ].

	aLineStart := aLineEnd := self position.

	(self isLineDelimiter: self peek) ifFalse: [
		self
			nextSegment: [ :anItem | self isLineDelimiter: anItem ]
			indicesDo: [ :aStart :anEnd | aLineEnd := anEnd ] ].

	(self hasNext and: [ self isLineDelimiter: self peek ])
		ifTrue: [ aLineSeparator := self next ].
		
	(self hasNext and: [ (self isLineFeed: self peek) and: [ self isCarriageReturn: aLineSeparator ] ])
		ifTrue: [ self next ].

	^ anIndicesBlock
		value: aLineStart
		value: aLineEnd
		value: self position
]

{ #category : 'iterator - enumeration' }
TbRopeIterator >> nextSegment: aBlock [
	"Return a segment of item for those aBlock uniformly returns equal value for each consequent item"
	<return: #BlRope>

	^ self
		nextSegment: aBlock
		indicesDo: [ :aStart :anEnd :anInitialValue | self rope from: aStart to: anEnd ]
]

{ #category : 'iterator - enumeration' }
TbRopeIterator >> nextSegment: aBlock indicesDo: anIndicesBlock [
	"Evaluate aBlock with every item in the forward direction until aBlock returns a different value compared to the value
	produced by evaluating aBlock with the first item in a sequence or until we run out of items to iterate over.

	Once completed evaluate anIndicesBlock with the start and end position of the iterator thus defining a homogenous segment
	for every item of which aBlock returns the same value. The third argument of the anIndicesBlock is (optional) initial value which was used for comparison.
	Please note, that the result of evaluation of aBlock should not necessarily be a boolean, it can be any object.

	I return the result of evaluation of anIndicesBlock"
	| fromIndex toIndex initialValue |
	<return: #Object>

	self hasNext
		ifFalse: [ self errorReachedTheEnd ].
	
	"store position right before iteration"
	fromIndex := self position.
	
	"we want to have homogenous segments, so check what is the initial value"
	initialValue := aBlock value: self next.

	"we skip all items that do not belong to segment"
	[ self hasNext and: [ (aBlock value: self peek) = initialValue ] ] whileTrue: [ self next ].
	
	toIndex := self position.

	^ anIndicesBlock
		cull: fromIndex
		cull: toIndex
		cull: initialValue
]

{ #category : 'iterator - enumeration' }
TbRopeIterator >> nextSpan [
	"Return a next homogeneous subrope based on attributes"
	^ self subclassResponsibility
]

{ #category : 'iterator - enumeration' }
TbRopeIterator >> nextSpan: aBlock [
	"Evaluate aBlock with each attribute from each span and return a span for which aBlock returns either true or false.
	The key here is that we can redefine what homogeneity of the span mean"
	| initialValue aStart anEnd |
	<return: #BlRope>

	self hasNext
		ifFalse: [ self errorReachedTheEnd ].

	initialValue := nil.
	aStart := anEnd := self position.

	[ self hasNext and: [
		| theNextValue |
		theNextValue := self attributes anySatisfy: aBlock.
		initialValue ifNil: [ initialValue := theNextValue ].
		initialValue = theNextValue.
	] ] whileTrue: [ self nextSpan ].

	anEnd := self position.

	^ self rope from: aStart to: anEnd
]

{ #category : 'iterator - enumeration' }
TbRopeIterator >> nextWhitespace [
	<return: #BlRope>

	^ self nextSegment: [ :item | item isCharacter not or: [ item isSeparator not ] ]
]

{ #category : 'iterator - enumeration' }
TbRopeIterator >> nextWord [
	<return: #BlRope>

	^ self nextSegment: [ :item | item isCharacter and: [ item isSeparator ] ]
]

{ #category : 'iterator - enumeration' }
TbRopeIterator >> peek [
	"Return an element at current #position without changing it.
	(#peek item is the same that would be returned by #next).
	I am similar to #peer but return an item to the right from the cursor"
	<return: #Object>

	^ self subclassResponsibility
]

{ #category : 'iterator - enumeration' }
TbRopeIterator >> peer [
	"Return an element before the current #position without moving the cursor.
	(#peer item is the same that would be returned by #previous).
	I am similar to #peek but return an item to the left from the cursor.
	
	Q: Why peer?
	A: Due to this example: `a child peering from behind a tree`. By this logic when using #peer we look from behind (kind of before) the cursor"
	<return: #Object>

	^ self subclassResponsibility
]

{ #category : 'iterator - accessing' }
TbRopeIterator >> position [
	"Return a *cursor* position.
	
	 H E L L O
	^ ^ ^ ^ ^ ^
	0 1 2 3 4 5
	
	Imagine the cursor is at position 1.
		- If we #peek, we get 'E' and the `cursor` stays on its place.
		- If we ask for #next, the iterator returns 'E' and moves cursor one position to the right (2).
		- If we ask for #previous, we get 'H' and move one position to the left (0).
		- It is possible to #skip: positions either moving to the left or to the right"
	<return: #Number>

	^ self subclassResponsibility
]

{ #category : 'iterator - enumeration' }
TbRopeIterator >> previous [
	"Return previous element in the rope"
	<return: #Object>

	^ self subclassResponsibility
]

{ #category : 'iterator - enumeration' }
TbRopeIterator >> previousSegment: aBlock indicesDo: anIndicesBlock [
	"Evaluate aBlock with every item in the backward direction until aBlock returns a different value compared to the value
	produced by evaluating aBlock with the first item in a sequence or until we run out of items to iterate over.

	Once completed evaluate anIndicesBlock with the start and end position of the iterator thus defining a homogenous segment
	for every item of which aBlock returns the same value. The third argument of the anIndicesBlock is (optional) initial value which was used for comparison.
	Please note, that the result of evaluation of aBlock should not necessarily be a boolean, it can be any object.

	I return the result of evaluation of anIndicesBlock"
	| fromIndex toIndex initialValue |
	<return: #Object>

	self hasPrevious
		ifFalse: [ self errorReachedTheStart ].
	
	"store position right before iteration"
	toIndex := self position.
	
	"we want to have homogenous segments, so check what is the initial value"
	initialValue := aBlock value: self previous.

	"we skip all items that do not belong to segment"
	[ self hasPrevious and: [ (aBlock value: self peer) = initialValue ] ] whileTrue: [ self previous ].
	
	fromIndex := self position.

	^ anIndicesBlock
		cull: fromIndex
		cull: toIndex
		cull: initialValue
]

{ #category : 'private - accessing' }
TbRopeIterator >> rope [
	^ rope
]

{ #category : 'instance creation' }
TbRopeIterator >> rope: aRope from: aStart to: anEnd [
	(aRope isNotEmpty and: [ aStart < 0 or: [ anEnd > aRope size ] ])
		ifTrue: [ self error: 'Iterator interval out of bounds!' ].
	(aRope isEmpty and: [ aStart ~= 0 or: [ anEnd ~= 0 ] ])
		ifTrue: [ self error: 'Iterator interval out of bounds!' ].

	rope := aRope.
	start := aStart min: anEnd.
	end := anEnd max: aStart.
]

{ #category : 'iterator - attributes' }
TbRopeIterator >> selectAttributes: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Collect into a new collection like the receiver, only those elements for 
	which aBlock evaluates to true. Answer the new collection."
	<return: #SequenceableCollection of: #BlTextAttribute>

	^ self attributes select: aBlock
]

{ #category : 'iterator - enumeration' }
TbRopeIterator >> skip: aNumber [
	"Skip given amount of items (that would be returned by #next or #prevous).
	aNumber can be negative and positive, sign defines a direction of iteration"

	self subclassResponsibility
]

{ #category : 'private - accessing' }
TbRopeIterator >> start [
	<return: #Number>
	
	^ start
]
