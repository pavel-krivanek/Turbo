Class {
	#name : #TbTerminalEventHandler,
	#superclass : #Object,
	#instVars : [
		'hostSpace'
	],
	#category : #'Turbo-Terminal'
}

{ #category : #'as yet unclassified' }
TbTerminalEventHandler class >> window: aMorphicWindow [
	^ self new
		window: aMorphicWindow;
		yourself
]

{ #category : #accessing }
TbTerminalEventHandler >> clear [


]

{ #category : #converting }
TbTerminalEventHandler >> convertButtonFromMouseButtonEvent: aMorphicEvent [

	aMorphicEvent redButtonChanged
		ifTrue: [ ^TbMouseButton primary ].
	aMorphicEvent blueButtonChanged
		ifTrue: [ ^ TbMouseButton middle ].
	aMorphicEvent yellowButtonChanged
		ifTrue: [ ^ TbMouseButton secondary ].
		
	^ aMorphicEvent whichButton
]

{ #category : #converting }
TbTerminalEventHandler >> convertButtonFromMouseEvent: aMorphicEvent [

	aMorphicEvent redButtonPressed
		ifTrue: [ ^ BlMouseEvent primaryButton ].
	aMorphicEvent blueButtonPressed
		ifTrue: [ ^ BlMouseEvent middleButton ].
	aMorphicEvent yellowButtonPressed
		ifTrue: [ ^ BlMouseEvent secondaryButton ].
		
	^ aMorphicEvent buttons
]

{ #category : #converting }
TbTerminalEventHandler >> convertKeyModifiersFromEvent: aMorphicEvent [ 
	| shift ctrl alt cmd |

	shift := aMorphicEvent shiftPressed.
	ctrl := aMorphicEvent controlKeyPressed.
	alt := aMorphicEvent altKeyPressed.
	cmd := aMorphicEvent commandKeyPressed.
	
	^ BlKeyModifiers shift: shift ctrl: ctrl alt: alt cmd: cmd
]

{ #category : #'event handling' }
TbTerminalEventHandler >> convertMousePosition: anEvent andDo: aBlock [

	"changes event position to be relative to the panelRect, not to the world"
	anEvent setPosition: (self window pointToSpace: anEvent position).
	aBlock value: anEvent
]

{ #category : #accessing }
TbTerminalEventHandler >> enqueue: aBlEvent [
	self hostSpace enqueueEvent: aBlEvent
]

{ #category : #converting }
TbTerminalEventHandler >> globalMousePositionForEvent: anEvent [
	^ window position + anEvent position
]

{ #category : #'event handling' }
TbTerminalEventHandler >> handleDropMorph: anEvent [
	"| pos |
	pos := anEvent position - self window position.
	anEvent setPosition: pos contents: anEvent contents hand: anEvent hand.
	self enqueue: anEvent"
]

{ #category : #'event handling' }
TbTerminalEventHandler >> handleKeyDown: aMorphicEvent [
	| aBlEvent |

	aBlEvent := TbKeyDownEvent new
		key: aMorphicEvent key;
		scanCode: aMorphicEvent scanCode;
		
		modifiers: (self convertKeyModifiersFromEvent: aMorphicEvent);
		timestamp: DateAndTime now;
		position: aMorphicEvent position;
		screenPosition: (self globalMousePositionForEvent: aMorphicEvent).

	self enqueue: aBlEvent
]

{ #category : #'event handling' }
TbTerminalEventHandler >> handleKeyUp: aMorphicEvent [
	| aBlEvent |
		
	aBlEvent := BlKeyUpEvent new
		key: aMorphicEvent key;
		scanCode: aMorphicEvent scanCode;
		
		modifiers: (self convertKeyModifiersFromEvent: aMorphicEvent);
		timestamp: DateAndTime now;
		position: aMorphicEvent position;
		screenPosition: (self globalMousePositionForEvent: aMorphicEvent).

	self enqueue: aBlEvent
]

{ #category : #'event handling' }
TbTerminalEventHandler >> handleKeystroke: aMorphicEvent [
	| aBlEvent |
		
	aBlEvent := BlKeystrokeEvent new
		char: aMorphicEvent keyCharacter;
		scanCode: aMorphicEvent scanCode;
		
		modifiers: (self convertKeyModifiersFromEvent: aMorphicEvent);
		timestamp: DateAndTime now;
		position: aMorphicEvent position;
		screenPosition: (self globalMousePositionForEvent: aMorphicEvent).
	
	self enqueue: aBlEvent
]

{ #category : #'event handling' }
TbTerminalEventHandler >> handleMouseDown: anEvent [

	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | 
		| aBlEvent |
		aBlEvent := BlMouseDownEvent new
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
TbTerminalEventHandler >> handleMouseEnter: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TbTerminalEventHandler >> handleMouseLeave: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TbTerminalEventHandler >> handleMouseMove: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | 
		| aBlEvent |

		aBlEvent := BlMouseMoveEvent new
			position: aMorphicEvent position;
			delta: aMorphicEvent position - (self window pointToSpace: aMorphicEvent startPoint);
			screenPosition: (self globalMousePositionForEvent: aMorphicEvent);
			modifiers: (self convertKeyModifiersFromEvent: aMorphicEvent);
			timestamp: DateAndTime now
			yourself.
		self enqueue: aBlEvent ]
]

{ #category : #'event handling' }
TbTerminalEventHandler >> handleMouseOver: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TbTerminalEventHandler >> handleMouseUp: anEvent [

	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | 
		| aBlEvent |
		aBlEvent := BlMouseUpEvent new
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
TbTerminalEventHandler >> handleMouseWheel: anEvent [
	
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
TbTerminalEventHandler >> handleWindowClosed: aMorphicEvent [
	| aBlEvent |
	
	aBlEvent := TbSpaceCloseRequest new
		timestamp: DateAndTime now.
	
	self enqueue: aBlEvent
]

{ #category : #'event handling' }
TbTerminalEventHandler >> handleWindowEvent: anEvent [
	
]

{ #category : #'event handling' }
TbTerminalEventHandler >> handleWindowResize: aMorphicEvent [
	| aBlEvent |
	aBlEvent := TbSpaceResizedEvent new
		extent: aMorphicEvent width @ aMorphicEvent height;
		timestamp: DateAndTime now;
		yourself.
	self enqueue: aBlEvent
]

{ #category : #accessing }
TbTerminalEventHandler >> hostSpace [
	^ hostSpace
]

{ #category : #accessing }
TbTerminalEventHandler >> hostSpace: anObject [
	hostSpace := anObject
]

{ #category : #accessing }
TbTerminalEventHandler >> pulse [ 

	self readInput.
]

{ #category : #accessing }
TbTerminalEventHandler >> readInput [

	| stream byte |
	stream := Stdio stdin.
	
	byte := stream next.
	byte ifNil: [ ^ self ].
	byte = 27 ifTrue: [ 
		byte := stream next.
		byte = 91 ifTrue: [ 
			byte := stream next.
			byte = 77 ifTrue: [ 
				"mouse event"
				| x y aBlEvent |
				byte := stream next.
				byte := stream next.
				x := byte - 32.
				byte := stream next.
				y := byte - 32.
				
				aBlEvent := TbMouseDownEvent new
					position: (x@y);
					screenPosition: (x@y);
					button: (TbMouseButton primary);
					timestamp: DateAndTime now
					yourself.
				self enqueue: aBlEvent. 
				aBlEvent := TbMouseUpEvent new
					position: (x@y);
					screenPosition: (x@y);
					button: (TbMouseButton primary);
					timestamp: DateAndTime now
					yourself.
				self enqueue: aBlEvent 
				
		 ] ]
]
]

{ #category : #'event handling' }
TbTerminalEventHandler >> transform: aPoint [

	^ (aPoint / (8@16)) floor
]

{ #category : #accessing }
TbTerminalEventHandler >> window [
	^ window
]

{ #category : #accessing }
TbTerminalEventHandler >> window: aBlMorphicWindow [
	window := aBlMorphicWindow
]
