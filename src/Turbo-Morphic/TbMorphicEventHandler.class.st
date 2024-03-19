Class {
	#name : #TbMorphicEventHandler,
	#superclass : #Object,
	#instVars : [
		'window'
	],
	#category : #'Turbo-Morphic'
}

{ #category : #'as yet unclassified' }
TbMorphicEventHandler class >> window: aMorphicWindow [
	^ self new
		window: aMorphicWindow;
		yourself
]

{ #category : #converting }
TbMorphicEventHandler >> convertButtonFromMouseButtonEvent: aMorphicEvent [

	aMorphicEvent redButtonChanged
		ifTrue: [ ^TbMouseButton primary ].
	aMorphicEvent blueButtonChanged
		ifTrue: [ ^TbMouseButton middle ].
	aMorphicEvent yellowButtonChanged
		ifTrue: [ ^ TbMouseButton secondary ].
		
	^ aMorphicEvent whichButton
]

{ #category : #converting }
TbMorphicEventHandler >> convertButtonFromMouseEvent: aMorphicEvent [

	aMorphicEvent redButtonPressed
		ifTrue: [ ^ TbMouseEvent primaryButton ].
	aMorphicEvent blueButtonPressed
		ifTrue: [ ^ TbMouseEvent middleButton ].
	aMorphicEvent yellowButtonPressed
		ifTrue: [ ^ TbMouseEvent secondaryButton ].
		
	^ aMorphicEvent buttons
]

{ #category : #converting }
TbMorphicEventHandler >> convertKeyModifiersFromEvent: aMorphicEvent [ 
	| shift ctrl alt cmd |

	shift := aMorphicEvent shiftPressed.
	ctrl := aMorphicEvent controlKeyPressed.
	alt := aMorphicEvent altKeyPressed.
	cmd := aMorphicEvent commandKeyPressed.
	
	^ TbKeyModifiers shift: shift ctrl: ctrl alt: alt cmd: cmd
]

{ #category : #'event handling' }
TbMorphicEventHandler >> convertMousePosition: anEvent andDo: aBlock [

	"changes event position to be relative to the panelRect, not to the world"
	| transformed |
	transformed := anEvent copy.
	transformed setPosition: (self window pointToSpace: anEvent position).
	aBlock value: transformed
]

{ #category : #accessing }
TbMorphicEventHandler >> enqueue: aBlEvent [
	self window hostSpace enqueueEvent: aBlEvent
]

{ #category : #converting }
TbMorphicEventHandler >> globalMousePositionForEvent: anEvent [
	^ window position + anEvent position
]

{ #category : #'event handling' }
TbMorphicEventHandler >> handleDropMorph: anEvent [
	"| pos |
	pos := anEvent position - self window position.
	anEvent setPosition: pos contents: anEvent contents hand: anEvent hand.
	self enqueue: anEvent"
]

{ #category : #'event handling' }
TbMorphicEventHandler >> handleKeyDown: anEvent [
	| aBlEvent |

	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | 
		aBlEvent := TbKeyDownEvent new
			key: aMorphicEvent key;
			scanCode: aMorphicEvent scanCode;
			
			modifiers: (self convertKeyModifiersFromEvent: aMorphicEvent);
			timestamp: DateAndTime now;
			position: (self transform: aMorphicEvent position);
			screenPosition: (self globalMousePositionForEvent: aMorphicEvent).

		self enqueue: aBlEvent
	]
]

{ #category : #'event handling' }
TbMorphicEventHandler >> handleKeyUp: anEvent [
	| aBlEvent |
	
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | 
		aBlEvent := TbKeyUpEvent new
			key: aMorphicEvent key;
			scanCode: aMorphicEvent scanCode;
			
			modifiers: (self convertKeyModifiersFromEvent: aMorphicEvent);
			timestamp: DateAndTime now;
			position: (self transform: aMorphicEvent position);
			screenPosition: (self globalMousePositionForEvent: aMorphicEvent).

		self enqueue: aBlEvent
	]
]

{ #category : #'event handling' }
TbMorphicEventHandler >> handleKeystroke: anEvent [
	| aBlEvent |
		
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent |
		aBlEvent := TbKeystrokeEvent new
			char: aMorphicEvent keyCharacter;
			scanCode: aMorphicEvent scanCode;
			
			modifiers: (self convertKeyModifiersFromEvent: aMorphicEvent);
			timestamp: DateAndTime now;
			position: (self transform: aMorphicEvent position);
			screenPosition: (self globalMousePositionForEvent: aMorphicEvent).
		
		self enqueue: aBlEvent 
	]
]

{ #category : #'event handling' }
TbMorphicEventHandler >> handleMouseDown: anEvent [

	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | 
		| aBlEvent |
		aBlEvent := TbMouseDownEvent new
			position: (self transform: (aMorphicEvent position));
			screenPosition: (self transform: ((self globalMousePositionForEvent: aMorphicEvent)));
			modifiers: (self convertKeyModifiersFromEvent: aMorphicEvent);
			button: (self convertButtonFromMouseButtonEvent: aMorphicEvent);
			timestamp: DateAndTime now
			yourself.
		self enqueue: aBlEvent ].
	
	window takeKeyboardFocus
]

{ #category : #'event handling' }
TbMorphicEventHandler >> handleMouseEnter: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TbMorphicEventHandler >> handleMouseLeave: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TbMorphicEventHandler >> handleMouseMove: anEvent [

	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | 
		| aBlEvent |

		aBlEvent := TbMouseMoveEvent new
			position: (self transform:aMorphicEvent position) ;
			delta: (self transform: (aMorphicEvent position - (self window pointToSpace: aMorphicEvent startPoint)));
			screenPosition: (self transform: (self globalMousePositionForEvent: aMorphicEvent));
			modifiers: (self convertKeyModifiersFromEvent: aMorphicEvent);
			timestamp: DateAndTime now
			yourself.
		self enqueue: aBlEvent ]
]

{ #category : #'event handling' }
TbMorphicEventHandler >> handleMouseOver: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TbMorphicEventHandler >> handleMouseUp: anEvent [

	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | 
		| aBlEvent |
		aBlEvent := TbMouseUpEvent new
			position: (self transform: (aMorphicEvent position));
			screenPosition: (self transform: ((self globalMousePositionForEvent: aMorphicEvent)));
			modifiers: (self convertKeyModifiersFromEvent: aMorphicEvent);
			button: (self convertButtonFromMouseButtonEvent: aMorphicEvent);
			timestamp: DateAndTime now
			yourself.
		self enqueue: aBlEvent ].
	
	window takeKeyboardFocus.
]

{ #category : #'event handling' }
TbMorphicEventHandler >> handleMouseWheel: anEvent [
	
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | 
		| aBlEvent |

		aBlEvent := BlScrollEvent new
			modifiers: (self convertKeyModifiersFromEvent: aMorphicEvent);
			button: (self convertButtonFromMouseEvent: aMorphicEvent);
			position: aMorphicEvent position;
			screenPosition: (self globalMousePositionForEvent: aMorphicEvent);
			direction: aMorphicEvent direction;
			timestamp: DateAndTime now.
		
		self enqueue: aBlEvent ]
]

{ #category : #'event handling' }
TbMorphicEventHandler >> handleWindowClosed: aMorphicEvent [
	| aBlEvent |
	
	aBlEvent := TbSpaceCloseRequest new
		timestamp: DateAndTime now.
	
	self enqueue: aBlEvent
]

{ #category : #'event handling' }
TbMorphicEventHandler >> handleWindowEvent: anEvent [
	
]

{ #category : #'event handling' }
TbMorphicEventHandler >> handleWindowResize: aMorphicEvent [
	| aBlEvent |
	aBlEvent := TbSpaceResizedEvent new
		extent: aMorphicEvent width @ aMorphicEvent height;
		timestamp: DateAndTime now;
		yourself.
	self enqueue: aBlEvent
]

{ #category : #'event handling' }
TbMorphicEventHandler >> transform: aPoint [

	^ (aPoint / (8@16)) floor
]

{ #category : #accessing }
TbMorphicEventHandler >> window [
	^ window
]

{ #category : #accessing }
TbMorphicEventHandler >> window: aBlMorphicWindow [
	window := aBlMorphicWindow
]
