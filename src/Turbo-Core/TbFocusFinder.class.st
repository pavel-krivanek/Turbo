"
I am a focus finder.

I am responsible for finding the next focusable element in a given direction from provided focused element
"
Class {
	#name : 'TbFocusFinder',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'bestCandidateBounds',
		'temporaryBounds',
		'focusedBounds'
	],
	#category : 'Turbo-Core-Utilities - Focus',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Focus'
}

{ #category : 'accessing' }
TbFocusFinder >> bestCandidateBounds [
	^ bestCandidateBounds
]

{ #category : 'initialization' }
TbFocusFinder >> initialize [
	super initialize.
	
	bestCandidateBounds := TbBounds new.
	temporaryBounds := TbBounds new.
	focusedBounds := TbBounds new
]

{ #category : 'private - focus' }
TbFocusFinder >> nextFocus: aFocusedElement in: aCollectionOfElements within: aFocusRootElement from: aFocusedBounds along: aBlFocusSearchDirection [
	| requestedFocusedBounds |
	
	requestedFocusedBounds := aFocusedBounds.
	
	aFocusedElement
		ifNotNil: [
			requestedFocusedBounds
				ifNil: [ requestedFocusedBounds := focusedBounds ].
			aFocusedElement focusedBounds: requestedFocusedBounds.
			aFocusRootElement localBoundsToMine: requestedFocusedBounds fromChild: aFocusedElement ]
		ifNil: [
			requestedFocusedBounds := aFocusedBounds.
			requestedFocusedBounds
				ifNil: [
					requestedFocusedBounds := focusedBounds.
					aBlFocusSearchDirection initFocusedBounds: requestedFocusedBounds root: aFocusRootElement ] ].
		
	^ aBlFocusSearchDirection
		nextFocus: aFocusedElement
		in: aCollectionOfElements
		within: aFocusRootElement
		from: requestedFocusedBounds
		finder: self
]

{ #category : 'focus' }
TbFocusFinder >> nextFocus: aFocusedElement within: aFocusRootElement along: aBlFocusSearchDirection [

	^ self
		nextFocus: aFocusedElement
		within: aFocusRootElement
		from: nil
		along: aBlFocusSearchDirection
]

{ #category : 'private - focus' }
TbFocusFinder >> nextFocus: aFocusedElement within: aFocusRootElement from: aFocusedBounds along: aBlFocusSearchDirection [
	| theFocusables nextFocus |
	
	nextFocus := nil.
	theFocusables := OrderedCollection new.
	
	aFocusRootElement focusables: theFocusables along: aBlFocusSearchDirection.
	theFocusables ifNotEmpty: [ 
		nextFocus := self
			nextFocus: aFocusedElement
			in: theFocusables
			within: aFocusRootElement
			from: aFocusedBounds
			along: aBlFocusSearchDirection ].
	
	
	^ nextFocus
]

{ #category : 'focus' }
TbFocusFinder >> nextFocusFrom: aFocusedBounds within: aFocusRootElement along: aBlFocusSearchDirection [
	
	focusedBounds bounds: aFocusedBounds.
	^ self
		nextFocus: nil
		within: aFocusRootElement
		from: focusedBounds
		along: aBlFocusSearchDirection
]

{ #category : 'private - accessing' }
TbFocusFinder >> nextFocusable: anElement in: aCollection [
	"Return a next focusable element after a given element within provided collection.
	If anElement is nil I return the first element from a collection or nil if it is empty"
	<return: #BlElement or: nil>

	^ anElement
		ifNotNil: [ | position |
			position := aCollection lastIndexOf: anElement.
			(position > 0 and: [ position + 1 <= aCollection size ])
				ifTrue: [ aCollection at: position + 1 ]
				ifFalse: [ aCollection
			ifEmpty: [ nil ]
			ifNotEmpty: [ aCollection first ] ] ]
		ifNil: [ aCollection
			ifEmpty: [ nil ]
			ifNotEmpty: [ aCollection first ] ]
]

{ #category : 'private - accessing' }
TbFocusFinder >> previousFocusable: anElement in: aCollection [
	"Return a previous focusable element before a given element within provided collection.
	If anElement is nil I return the last element from a collection or nil if it is empty"
	<return: #BlElement or: nil>

	^ anElement
		ifNotNil: [ | position |
			position := aCollection lastIndexOf: anElement.
			position > 1
				ifTrue: [ aCollection at: position - 1 ]
				ifFalse: [ aCollection
			ifEmpty: [ nil ]
			ifNotEmpty: [ aCollection last ] ] ]
		ifNil: [ aCollection
			ifEmpty: [ nil ]
			ifNotEmpty: [ aCollection last ] ]
]

{ #category : 'accessing' }
TbFocusFinder >> temporaryBounds [
	^ temporaryBounds
]
