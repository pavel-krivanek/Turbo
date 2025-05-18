Class {
	#name : 'TbTouchProcessor',
	#superclass : 'TbBaseEventProcessor',
	#instVars : [
		'previousTouchDownEvent',
		'pressedPointers'
	],
	#category : 'Turbo-Core-Space-Support',
	#package : 'Turbo-Core',
	#tag : 'Space-Support'
}

{ #category : 'api - touch down' }
TbTouchProcessor >> handleTouchDown: aTouchDownEvent [
	| aTargetElement |

	"First we need to register a pressed pointer"
	
	self
		assert: [ (self pressedPointers includes: aTouchDownEvent pointerId) not ]
		description: [ 'Pointer is already pressed' ].
	
	self pressedPointers add: aTouchDownEvent pointerId.

	aTargetElement := self processPicking: aTouchDownEvent.

	aTouchDownEvent target: aTargetElement.
	aTouchDownEvent pointerIndex: self pressedPointers size.

	self fireEvent: aTouchDownEvent.

	"now we can update the cursor from the target"
	self updateCursorFrom: aTargetElement.

	"store last mouse down event"
	previousTouchDownEvent := aTouchDownEvent
]

{ #category : 'api - touch move' }
TbTouchProcessor >> handleTouchMove: aTouchEvent [
	| aTargetElement |
	
	aTargetElement := self processPicking: aTouchEvent.
	self
		assert: [ aTargetElement isAttachedToSceneGraph ]
		description: [ 'Target element must be attached to the scene graph' ].
	
	aTouchEvent target: aTargetElement.
	aTouchEvent pointerIndex: (self pressedPointers indexOf: aTouchEvent pointerId).

	self processTouchMove: aTouchEvent
]

{ #category : 'api - touch up' }
TbTouchProcessor >> handleTouchUp: aTouchEvent [
	| aTargetElement aPointerIndex |

	"we need to unregister a pointer"
	
	aPointerIndex := self pressedPointers indexOf: aTouchEvent pointerId.
	self pressedPointers removeAt: aPointerIndex.
	
	aTargetElement := self processPicking: aTouchEvent.
	
	aTouchEvent target: aTargetElement.
	aTouchEvent pointerIndex: aPointerIndex.

	self processTouchUp: aTouchEvent
]

{ #category : 'initialization' }
TbTouchProcessor >> initialize [
	super initialize.

	"a set of currently pressed pointers ids"
	pressedPointers := OrderedCollection new
]

{ #category : 'accessing' }
TbTouchProcessor >> pressedPointers [
	^ pressedPointers
]

{ #category : 'event processing' }
TbTouchProcessor >> processPicking: aTouchEvent [
	<return: #BlElement>
	| aTargetElement |

	aTargetElement := self space root findMouseEventTargetAt: aTouchEvent position.
	"we have to ensure that aTarget is not nil"
	aTargetElement ifNil: [ aTargetElement := self space root ].
	^ aTargetElement
]

{ #category : 'api - touch move' }
TbTouchProcessor >> processTouchMove: aTouchMoveEvent [
	self fireEvent: aTouchMoveEvent.

	"now we can update the cursor from the target"
	self updateCursorFrom: aTouchMoveEvent target
]

{ #category : 'api - touch up' }
TbTouchProcessor >> processTouchUp: aTouchUpEvent [
	
	self fireEvent: aTouchUpEvent.
	
	self updateCursorFrom: aTouchUpEvent target
]

{ #category : 'event processing' }
TbTouchProcessor >> updateCursorFrom: aTarget [
	| t |
	t := aTarget.
	[ t mouseCursor isNil and: [ t parent isNotNil ] ] whileTrue: [ t := t parent ].
	self space currentCursor = t mouseCursor
		ifTrue: [ ^ self ].
	self space currentCursor: t mouseCursor
]
