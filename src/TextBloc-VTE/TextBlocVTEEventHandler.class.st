Class {
	#name : #TextBlocVTEEventHandler,
	#superclass : #Object,
	#instVars : [
		'hostSpace',
		'surface'
	],
	#category : #'TextBloc-VTE'
}

{ #category : #'as yet unclassified' }
TextBlocVTEEventHandler class >> window: aMorphicWindow [
	^ self new
		window: aMorphicWindow;
		yourself
]

{ #category : #accessing }
TextBlocVTEEventHandler >> clear [


]

{ #category : #converting }
TextBlocVTEEventHandler >> convertButtonFromMouseButtonEvent: aMorphicEvent [

	aMorphicEvent redButtonChanged
		ifTrue: [ ^BlMouseButton primary ].
	aMorphicEvent blueButtonChanged
		ifTrue: [ ^ BlMouseButton middle ].
	aMorphicEvent yellowButtonChanged
		ifTrue: [ ^ BlMouseButton secondary ].
		
	^ aMorphicEvent whichButton
]

{ #category : #converting }
TextBlocVTEEventHandler >> convertButtonFromMouseEvent: aMorphicEvent [

	aMorphicEvent redButtonPressed
		ifTrue: [ ^ BlMouseEvent primaryButton ].
	aMorphicEvent blueButtonPressed
		ifTrue: [ ^ BlMouseEvent middleButton ].
	aMorphicEvent yellowButtonPressed
		ifTrue: [ ^ BlMouseEvent secondaryButton ].
		
	^ aMorphicEvent buttons
]

{ #category : #converting }
TextBlocVTEEventHandler >> convertKeyModifiersFromEvent: aMorphicEvent [ 
	| shift ctrl alt cmd |

	shift := aMorphicEvent shiftPressed.
	ctrl := aMorphicEvent controlKeyPressed.
	alt := aMorphicEvent altKeyPressed.
	cmd := aMorphicEvent commandKeyPressed.
	
	^ BlKeyModifiers shift: shift ctrl: ctrl alt: alt cmd: cmd
]

{ #category : #'event handling' }
TextBlocVTEEventHandler >> convertMousePosition: anEvent andDo: aBlock [

	"changes event position to be relative to the panelRect, not to the world"
	anEvent setPosition: (self window pointToSpace: anEvent position).
	aBlock value: anEvent
]

{ #category : #accessing }
TextBlocVTEEventHandler >> enqueue: aBlEvent [
	self hostSpace enqueueEvent: aBlEvent
]

{ #category : #converting }
TextBlocVTEEventHandler >> globalMousePositionForEvent: anEvent [
	^ window position + anEvent position
]

{ #category : #'event handling' }
TextBlocVTEEventHandler >> handleDropMorph: anEvent [
	"| pos |
	pos := anEvent position - self window position.
	anEvent setPosition: pos contents: anEvent contents hand: anEvent hand.
	self enqueue: anEvent"
]

{ #category : #'event handling' }
TextBlocVTEEventHandler >> handleKeyDown: aMorphicEvent [
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
TextBlocVTEEventHandler >> handleKeyUp: aMorphicEvent [
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
TextBlocVTEEventHandler >> handleKeystroke: aMorphicEvent [
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
TextBlocVTEEventHandler >> handleMouseDown: anEvent [

	| aBlEvent |

	aBlEvent := BlMouseDownEvent  new
		position: (self transformPoint: anEvent position);
		"delta: aMorphicEvent position - (self window pointToSpace: aMorphicEvent startPoint);
		screenPosition: (self convertPosition: anEvent position);
		modifiers: (self convertKeyModifiersFromEvent: aMorphicEvent);"
		timestamp: DateAndTime now
		yourself.
		
	self enqueue: aBlEvent 

"
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | 
		| aBlEvent |
		aBlEvent := BlMouseDownEvent new
			position: (self transform: (aMorphicEvent position));
			screenPosition: (self transform: ((self globalMousePositionForEvent: aMorphicEvent)));
			modifiers: (self convertKeyModifiersFromEvent: aMorphicEvent);
			button: (self convertButtonFromMouseButtonEvent: aMorphicEvent);
			timestamp: DateAndTime now
			yourself.
		self enqueue: aBlEvent ]."
	
	window takeKeyboardFocus
]

{ #category : #'event handling' }
TextBlocVTEEventHandler >> handleMouseEnter: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TextBlocVTEEventHandler >> handleMouseLeave: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TextBlocVTEEventHandler >> handleMouseMove: anEvent [

	| aBlEvent |

	aBlEvent := BlMouseMoveEvent new
		position: (self transformPoint: anEvent position);
		"delta: aMorphicEvent position - (self window pointToSpace: aMorphicEvent startPoint);
		screenPosition: (self convertPosition: anEvent position);
		modifiers: (self convertKeyModifiersFromEvent: aMorphicEvent);"
		timestamp: DateAndTime now
		yourself.
		
	self enqueue: aBlEvent 
]

{ #category : #'event handling' }
TextBlocVTEEventHandler >> handleMouseOver: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TextBlocVTEEventHandler >> handleMouseUp: anEvent [

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
TextBlocVTEEventHandler >> handleMouseWheel: anEvent [
	
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
TextBlocVTEEventHandler >> handleWindowClosed: aMorphicEvent [
	| aBlEvent |
	
	aBlEvent := BlSpaceCloseRequest new
		timestamp: DateAndTime now.
	
	self enqueue: aBlEvent
]

{ #category : #'event handling' }
TextBlocVTEEventHandler >> handleWindowEvent: anEvent [
	
]

{ #category : #'event handling' }
TextBlocVTEEventHandler >> handleWindowResize: aMorphicEvent [
	| aBlEvent |
	aBlEvent := BlSpaceResizedEvent new
		extent: aMorphicEvent width @ aMorphicEvent height;
		timestamp: DateAndTime now;
		yourself.
	self enqueue: aBlEvent
]

{ #category : #accessing }
TextBlocVTEEventHandler >> hostSpace [
	^ hostSpace
]

{ #category : #accessing }
TextBlocVTEEventHandler >> hostSpace: anObject [
	hostSpace := anObject
]

{ #category : #'event handling' }
TextBlocVTEEventHandler >> initialize [ 

	super initialize.
]

{ #category : #accessing }
TextBlocVTEEventHandler >> pulse [ 

	self readInput.
]

{ #category : #accessing }
TextBlocVTEEventHandler >> readInput [

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

{ #category : #accessing }
TextBlocVTEEventHandler >> surface [

	^ surface
]

{ #category : #accessing }
TextBlocVTEEventHandler >> surface: anObject [

	surface := anObject
]

{ #category : #'event handling' }
TextBlocVTEEventHandler >> transform: aPoint [

	^ (aPoint / (8@16)) floor
]

{ #category : #'event handling' }
TextBlocVTEEventHandler >> transformPoint: aPoint [
 
	 ^ surface transformPoint: aPoint

]

{ #category : #accessing }
TextBlocVTEEventHandler >> window [
	^ window
]

{ #category : #accessing }
TextBlocVTEEventHandler >> window: aBlMorphicWindow [
	window := aBlMorphicWindow
]
