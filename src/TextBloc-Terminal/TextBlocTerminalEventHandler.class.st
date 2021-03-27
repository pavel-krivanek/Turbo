Class {
	#name : #TextBlocTerminalEventHandler,
	#superclass : #Object,
	#instVars : [
		'hostSpace'
	],
	#category : #'TextBloc-Terminal'
}

{ #category : #'as yet unclassified' }
TextBlocTerminalEventHandler class >> window: aMorphicWindow [
	^ self new
		window: aMorphicWindow;
		yourself
]

{ #category : #accessing }
TextBlocTerminalEventHandler >> clear [


]

{ #category : #converting }
TextBlocTerminalEventHandler >> convertButtonFromMouseButtonEvent: aMorphicEvent [

	aMorphicEvent redButtonChanged
		ifTrue: [ ^BlMouseButton primary ].
	aMorphicEvent blueButtonChanged
		ifTrue: [ ^ BlMouseButton middle ].
	aMorphicEvent yellowButtonChanged
		ifTrue: [ ^ BlMouseButton secondary ].
		
	^ aMorphicEvent whichButton
]

{ #category : #converting }
TextBlocTerminalEventHandler >> convertButtonFromMouseEvent: aMorphicEvent [

	aMorphicEvent redButtonPressed
		ifTrue: [ ^ BlMouseEvent primaryButton ].
	aMorphicEvent blueButtonPressed
		ifTrue: [ ^ BlMouseEvent middleButton ].
	aMorphicEvent yellowButtonPressed
		ifTrue: [ ^ BlMouseEvent secondaryButton ].
		
	^ aMorphicEvent buttons
]

{ #category : #converting }
TextBlocTerminalEventHandler >> convertKeyModifiersFromEvent: aMorphicEvent [ 
	| shift ctrl alt cmd |

	shift := aMorphicEvent shiftPressed.
	ctrl := aMorphicEvent controlKeyPressed.
	alt := aMorphicEvent altKeyPressed.
	cmd := aMorphicEvent commandKeyPressed.
	
	^ BlKeyModifiers shift: shift ctrl: ctrl alt: alt cmd: cmd
]

{ #category : #'event handling' }
TextBlocTerminalEventHandler >> convertMousePosition: anEvent andDo: aBlock [

	"changes event position to be relative to the panelRect, not to the world"
	anEvent setPosition: (self window pointToSpace: anEvent position).
	aBlock value: anEvent
]

{ #category : #accessing }
TextBlocTerminalEventHandler >> enqueue: aBlEvent [
	self hostSpace enqueueEvent: aBlEvent
]

{ #category : #converting }
TextBlocTerminalEventHandler >> globalMousePositionForEvent: anEvent [
	^ window position + anEvent position
]

{ #category : #'event handling' }
TextBlocTerminalEventHandler >> handleDropMorph: anEvent [
	"| pos |
	pos := anEvent position - self window position.
	anEvent setPosition: pos contents: anEvent contents hand: anEvent hand.
	self enqueue: anEvent"
]

{ #category : #'event handling' }
TextBlocTerminalEventHandler >> handleKeyDown: aMorphicEvent [
	| aBlEvent |

	aBlEvent := BlKeyDownEvent new
		key: aMorphicEvent key;
		scanCode: aMorphicEvent scanCode;
		
		modifiers: (self convertKeyModifiersFromEvent: aMorphicEvent);
		timestamp: DateAndTime now;
		position: aMorphicEvent position;
		screenPosition: (self globalMousePositionForEvent: aMorphicEvent).

	self enqueue: aBlEvent
]

{ #category : #'event handling' }
TextBlocTerminalEventHandler >> handleKeyUp: aMorphicEvent [
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
TextBlocTerminalEventHandler >> handleKeystroke: aMorphicEvent [
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
TextBlocTerminalEventHandler >> handleMouseDown: anEvent [

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
TextBlocTerminalEventHandler >> handleMouseEnter: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TextBlocTerminalEventHandler >> handleMouseLeave: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TextBlocTerminalEventHandler >> handleMouseMove: anEvent [
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
TextBlocTerminalEventHandler >> handleMouseOver: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TextBlocTerminalEventHandler >> handleMouseUp: anEvent [

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
TextBlocTerminalEventHandler >> handleMouseWheel: anEvent [
	
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
TextBlocTerminalEventHandler >> handleWindowClosed: aMorphicEvent [
	| aBlEvent |
	
	aBlEvent := BlSpaceCloseRequest new
		timestamp: DateAndTime now.
	
	self enqueue: aBlEvent
]

{ #category : #'event handling' }
TextBlocTerminalEventHandler >> handleWindowEvent: anEvent [
	
]

{ #category : #'event handling' }
TextBlocTerminalEventHandler >> handleWindowResize: aMorphicEvent [
	| aBlEvent |
	aBlEvent := BlSpaceResizedEvent new
		extent: aMorphicEvent width @ aMorphicEvent height;
		timestamp: DateAndTime now;
		yourself.
	self enqueue: aBlEvent
]

{ #category : #accessing }
TextBlocTerminalEventHandler >> hostSpace [
	^ hostSpace
]

{ #category : #accessing }
TextBlocTerminalEventHandler >> hostSpace: anObject [
	hostSpace := anObject
]

{ #category : #accessing }
TextBlocTerminalEventHandler >> pulse [ 

	self readInput.
]

{ #category : #accessing }
TextBlocTerminalEventHandler >> readInput [

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
				
				aBlEvent := BlMouseDownEvent new
					position: (x@y);
					screenPosition: (x@y);
					button: (BlMouseButton primary);
					timestamp: DateAndTime now
					yourself.
				self enqueue: aBlEvent. 
				aBlEvent := BlMouseUpEvent new
					position: (x@y);
					screenPosition: (x@y);
					button: (BlMouseButton primary);
					timestamp: DateAndTime now
					yourself.
				self enqueue: aBlEvent 
				
		 ] ]
]
]

{ #category : #'event handling' }
TextBlocTerminalEventHandler >> transform: aPoint [

	^ (aPoint / (8@16)) floor
]

{ #category : #accessing }
TextBlocTerminalEventHandler >> window [
	^ window
]

{ #category : #accessing }
TextBlocTerminalEventHandler >> window: aBlMorphicWindow [
	window := aBlMorphicWindow
]
