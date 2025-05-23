Class {
	#name : 'TbFocusProcessor',
	#superclass : 'TbBaseEventProcessor',
	#instVars : [
		'focusOwner',
		'focusChain'
	],
	#category : 'Turbo-Core-Space-Support',
	#package : 'Turbo-Core',
	#tag : 'Space-Support'
}

{ #category : 'event firing' }
TbFocusProcessor >> fireBlurEvent: anElement [
	"Create and send blur event that doesn't bubble, perform simple direct dispatch to the given target element"
	self
		dispatchEvent: (self newBlurEvent target: anElement)
		target: anElement
]

{ #category : 'event firing' }
TbFocusProcessor >> fireFocusEvent: anElement [
	"Send focus event that doesn't bubble, perform simple direct dispatch to the target"
	
	self
		dispatchEvent: (self newFocusEvent target: anElement)
		target: anElement
]

{ #category : 'event firing' }
TbFocusProcessor >> fireFocusInEvent: anElement [
	"Send focusIn event that should bubble"

	self fireEvent: (self newFocusInEvent target: anElement)
]

{ #category : 'event firing' }
TbFocusProcessor >> fireFocusOutEvent: anElement [
	"Send focusOut event that should bubble"

	self fireEvent: (self newFocusOutEvent target: anElement)
]

{ #category : 'event firing' }
TbFocusProcessor >> fireFocusTransferEvent: anElement from: aPreviousFocusedElement [
	"Send focus event that doesn't bubble, perform simple direct dispatch to the target"
	self
		dispatchEvent: (self newFocusTransferEvent
			target: anElement;
			transfer: aPreviousFocusedElement)
		target: anElement
]

{ #category : 'accessing' }
TbFocusProcessor >> focusOwner [
	^ focusOwner
]

{ #category : 'focus - processing' }
TbFocusProcessor >> handleMouseDown: anEvent [
	"Clicking outside does not mean focus should be lost"
]

{ #category : 'testing' }
TbFocusProcessor >> hasFocusOwner [
	"Return true if there is an element holding focus, false otherwise.
	When there are no elements interested in focus it is given to the root element.
	Note: focus owner may not exist during space initialization or inbetween blur and focus events"
	<return: #Boolean>

	^ focusOwner isNotNil
]

{ #category : 'focus - requesting' }
TbFocusProcessor >> looseFor: anElement [
	| evt |
	focusOwner ~= anElement
		ifTrue: [ ^ self ].
	
	evt := TbBaseFocusEvent new
		target: anElement;
		yourself.
		
	self processBlur: evt.
	"don't forget to forget focused element"
	focusOwner := nil
]

{ #category : 'instance creation' }
TbFocusProcessor >> newBlurEvent [
	"Create, initialize and return a blur event that should be sent to the element
	that just lost its focus"
	<return: #BlBlurEvent>

	^ TbBlurEvent new
		canBePropagated: false
]

{ #category : 'instance creation' }
TbFocusProcessor >> newFocusEvent [
	"Create, initialize and return a focus event that should be sent to the element
	after it gets focus"
	<return: #BlFocusEvent>

	^ TbFocusEvent new
		canBePropagated: false
]

{ #category : 'instance creation' }
TbFocusProcessor >> newFocusInEvent [
	"Create, initialize and return a focus-in event that should be sent
	as a part of focus processing"
	<return: #BlFocusInEvent>
	
	^ TbFocusInEvent new
]

{ #category : 'instance creation' }
TbFocusProcessor >> newFocusOutEvent [
	"Create, initialize and return a focus-out event that should be sent
	as a part of blur processing"
	<return: #BlFocusOutEvent>
	
	^ TbFocusOutEvent new
]

{ #category : 'instance creation' }
TbFocusProcessor >> newFocusTransferEvent [
	"Create, initialize and return a focus transfer event that should be sent to the element
	before performing a focus transfer"
	<return: #BlFocusTransferEvent>

	^ TbFocusTransferEvent new
]

{ #category : 'focus - processing' }
TbFocusProcessor >> processBlur: anElement [
	self
		assert: [ self hasFocusOwner ]
		description: [ 'Blur event can only be processed when there is a focused element' ].

	"First make a given element to loose focus, then send events"
	anElement focused: false.
	focusChain leafsDo: [ :aLeafElement | self fireFocusOutEvent: aLeafElement ].
	self fireBlurEvent: anElement
]

{ #category : 'focus - processing' }
TbFocusProcessor >> processFocus: anElement [
	self
		assert: [ anElement isNotNil ]
		description: [ 'Can not give focus to nil' ].
	self
		assert: [ anElement ~= focusOwner ]
		description: [ 'Can not give focus to the already focused element' ].

	"first make element to be focused"
	focusOwner := anElement.
	focusChain := TbFocusChain of: focusOwner.

	self space focusOwner: anElement.
	anElement focused: true.

	"then send events"
	self fireFocusInEvent: anElement.
	self fireFocusEvent: anElement
]

{ #category : 'focus - processing' }
TbFocusProcessor >> processTransfer: anElement [
	self
		assert: [ anElement isNotNil ]
		description: [ 'Can not give focus to nil' ].
	self
		assert: [ anElement ~= focusOwner ]
		description: [ 'Can not give focus to the already focused element' ].
	self
		assert: [ self hasFocusOwner ]
		description: [ 'Can not transfer focus from non-focused element' ].

	self fireFocusTransferEvent: anElement from: focusOwner
]

{ #category : 'focus - processing' }
TbFocusProcessor >> processWindowFocusIn: anEvent [

	self space grabFocus
]

{ #category : 'focus - processing' }
TbFocusProcessor >> processWindowFocusOut: anEvent [

	self space ungrabFocus
]

{ #category : 'focus - requesting' }
TbFocusProcessor >> requestFor: anElement [
	self
		assert: [ anElement isNotNil ]
		description: [ 'Focus requester must not be nil!' ].

	focusOwner = anElement
		ifTrue: [ ^ self ].

	"we should only process blur event when there is focused element, otherwise skip it"
	self hasFocusOwner
		ifTrue: [ self processBlur: focusOwner ].

	"don't forget to forget focused element"
	focusOwner := nil.
	"focus is processed with new requested focus owner"
	self processFocus: anElement
]

{ #category : 'focus - requesting' }
TbFocusProcessor >> transferTo: anElement [
	self
		assert: [ anElement isNotNil ]
		description: [ 'Can not transfer focus to nil!' ].

	self hasFocusOwner
		ifFalse: [ ^ self requestFor: anElement ].

	self processTransfer: anElement.
	self processBlur: focusOwner.
	"don't forget to forget focused element"
	focusOwner := nil.
	self processFocus: anElement
]
