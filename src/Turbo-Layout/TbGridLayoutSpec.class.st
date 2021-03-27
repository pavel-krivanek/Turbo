"
I define characteristics of a group of cells on the grid (indices, weight and alignment) along corresponding axis.

I am supposed to be immutable. In order to create a new spec with different parameters use provided copyWith*: methods

Public API and Key Messages

- span, declares indices on the grid. span first is an index of a row or column that cell wants to occupy.
- weight, proportional weight allowing to distribute cells proportionally. In order to work all cells in a group must have weight > 0.
- alignment, specifies how cells should be aligned within row or column groups.
- flexibility, dynamically determined based on current alignment and weight
- startDefined, true if span first is undefined. Means that it is up to grid to determine indices

	BlGridLayoutSpec new
		setAlignment: BlGridAlignment fill
		span:  (1 to: 2)
		startDefined:  true
		weight: 1
 
Internal Representation and Key Implementation Points.

Instance Variables
	alignment:		<BlGridAlignment>
	span:		<BlGridLayoutInterval>
	startDefined:		<Boolean>
	weight:		<Number>
"
Class {
	#name : #TbGridLayoutSpec,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'startDefined',
		'span',
		'alignment',
		'weight'
	],
	#classVars : [
		'DefaultWeight'
	],
	#pools : [
		'TbGridLayoutConstants'
	],
	#classInstVars : [
		'undefined'
	],
	#category : #'Turbo-Layout-Grid-Utilities'
}

{ #category : #cleanup }
TbGridLayoutSpec class >> cleanUp [
	super cleanUp.
	
	undefined := nil
]

{ #category : #'class initialization' }
TbGridLayoutSpec class >> initialize [
	DefaultWeight := 0
]

{ #category : #'instance creation' }
TbGridLayoutSpec class >> new [
	self error: 'Use one of the factory methods instead'
]

{ #category : #'instance creation' }
TbGridLayoutSpec class >> start: aStart [
	<return: #BlGridLayoutSpec>

	^ self
		start: aStart
		size: 1
]

{ #category : #'instance creation' }
TbGridLayoutSpec class >> start: aStart size: aSize [
	<return: #BlGridLayoutSpec>

	^ self
		start: aStart
		size: aSize
		alignment: TbGridAlignment undefined
]

{ #category : #'instance creation' }
TbGridLayoutSpec class >> start: aStart size: aSize alignment: anAlignment [
	<return: #BlGridLayoutSpec>

	^ self
		start: aStart
		size: aSize
		alignment: anAlignment
		weight: DefaultWeight
]

{ #category : #'instance creation' }
TbGridLayoutSpec class >> start: aStart size: aSize alignment: anAlignment weight: aWeight [
	<return: #BlGridLayoutSpec>

	 ^ self basicNew
		setAlignment: anAlignment
		span: (TbGridLayoutInterval min: aStart max: aStart + aSize)
		startDefined: aStart ~= UNDEFINED
		weight: aWeight
]

{ #category : #accessing }
TbGridLayoutSpec class >> undefined [
	<return: #BlGridLayoutSpec>
	
	^ undefined ifNil: [ undefined := self start: UNDEFINED ]
]

{ #category : #comparing }
TbGridLayoutSpec >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ span = anObject span and: [ alignment = anObject alignment ]
]

{ #category : #private }
TbGridLayoutSpec >> absoluteAlignment: isHorizontal [
	<return: #BlGridAlignment>

	(self alignment = TbGridAlignment undefined)
		ifFalse: [ ^ self alignment ].
	
	self hasWeight
		ifFalse: [ ^ isHorizontal
			ifTrue: [ TbGridAlignment start ]
			ifFalse: [ TbGridAlignment baseline ] ].
		
	^ TbGridAlignment fill
]

{ #category : #accessing }
TbGridLayoutSpec >> alignment [
	<return: #BlGridAlignment>

	^ alignment
]

{ #category : #copying }
TbGridLayoutSpec >> copyWithAlignment: anAlignment [
	<return: #BlGridLayoutSpec>

	^ self class basicNew
		setAlignment: anAlignment
		span: span
		startDefined: startDefined
		weight: weight
]

{ #category : #copying }
TbGridLayoutSpec >> copyWithSpan: newSpan [
	<return: #BlGridLayoutSpec>

	^ self class basicNew
		setAlignment: alignment
		span: newSpan
		startDefined: startDefined
		weight: weight
]

{ #category : #copying }
TbGridLayoutSpec >> copyWithWeight: newWeight [
	<return: #BlGridLayoutSpec>

	^ self class basicNew
		setAlignment: alignment
		span: span
		startDefined: startDefined
		weight: newWeight
]

{ #category : #accessing }
TbGridLayoutSpec >> flexibility [
	<return: #BlGridFlexibility>

	^ (self alignment = TbGridAlignment undefined or: [ self hasWeight ])
		ifTrue: [ TbGridLayoutBounds inflexible ]
		ifFalse: [ TbGridLayoutBounds canStretch ]
]

{ #category : #testing }
TbGridLayoutSpec >> hasWeight [
	<return: #Boolean>

	^ (self weight closeTo: 0.0) not
]

{ #category : #comparing }
TbGridLayoutSpec >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ span hash bitXor: alignment hash
]

{ #category : #initialization }
TbGridLayoutSpec >> setAlignment: anAlignment span: aSpan startDefined: isStartDefined weight: aWeight [

	"Debugging internal implementation"
	self
		assert: [ aSpan isKindOf: BlGridLayoutInterval ]
		description: [ 'Span must be a special type of Interval' ].

	alignment := anAlignment.
	span := aSpan.
	startDefined := isStartDefined.
	weight := aWeight
]

{ #category : #accessing }
TbGridLayoutSpec >> span [
	<return: #Interval>
	^ span
]

{ #category : #accessing }
TbGridLayoutSpec >> startDefined [
	<return: #Boolean>

	^ startDefined
]

{ #category : #accessing }
TbGridLayoutSpec >> weight [
	^ weight
]
