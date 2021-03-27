Class {
	#name : #TbFocusability,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#classInstVars : [
		'after',
		'before',
		'block'
	],
	#category : #'Turbo-Core-Basic-Properties'
}

{ #category : #accessing }
TbFocusability class >> after [
	^ after ifNil: [ after := BlFocusabilityAfter new ]
]

{ #category : #accessing }
TbFocusability class >> before [
	^ before ifNil: [ before := BlFocusabilityBefore new ]
]

{ #category : #accessing }
TbFocusability class >> block [
	^ block ifNil: [ block := BlFocusabilityBlock new ]
]

{ #category : #cleanup }
TbFocusability class >> cleanUp [
	super cleanUp.
	
	before := nil.
	after := nil.
	block := nil
]

{ #category : #comparing }
TbFocusability >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : #focus }
TbFocusability >> focusables: anOrderedCollection along: aBlFocusSearchDirection of: anElement [
	"Add focusable elements that are descendants of a given element (possibly including anElement) to anOrderedCollection"

	self subclassResponsibility
]

{ #category : #comparing }
TbFocusability >> hash [
	^ self class hash
]
