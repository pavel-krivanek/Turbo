Class {
	#name : #TextBlocNCursesEventHandler,
	#superclass : #Object,
	#instVars : [
		'window'
	],
	#category : #'TextBloc-NCurses'
}

{ #category : #'as yet unclassified' }
TextBlocNCursesEventHandler class >> window: aMorphicWindow [
	^ self new
		window: aMorphicWindow;
		yourself
]

{ #category : #converting }
TextBlocNCursesEventHandler >> convertButtonFromMouseButtonEvent: aMorphicEvent [

	aMorphicEvent redButtonChanged
		ifTrue: [ ^BlMouseButton primary ].
	aMorphicEvent blueButtonChanged
		ifTrue: [ ^ BlMouseButton middle ].
	aMorphicEvent yellowButtonChanged
		ifTrue: [ ^ BlMouseButton secondary ].
		
	^ aMorphicEvent whichButton
]

{ #category : #converting }
TextBlocNCursesEventHandler >> convertButtonFromMouseEvent: aMorphicEvent [

	aMorphicEvent redButtonPressed
		ifTrue: [ ^ BlMouseEvent primaryButton ].
	aMorphicEvent blueButtonPressed
		ifTrue: [ ^ BlMouseEvent middleButton ].
	aMorphicEvent yellowButtonPressed
		ifTrue: [ ^ BlMouseEvent secondaryButton ].
		
	^ aMorphicEvent buttons
]

{ #category : #converting }
TextBlocNCursesEventHandler >> convertKeyModifiersFromEvent: aMorphicEvent [ 
	| shift ctrl alt cmd |

	shift := aMorphicEvent shiftPressed.
	ctrl := aMorphicEvent controlKeyPressed.
	alt := aMorphicEvent altKeyPressed.
	cmd := aMorphicEvent commandKeyPressed.
	
	^ BlKeyModifiers shift: shift ctrl: ctrl alt: alt cmd: cmd
]

{ #category : #'event handling' }
TextBlocNCursesEventHandler >> convertMousePosition: anEvent andDo: aBlock [

	"changes event position to be relative to the panelRect, not to the world"
	anEvent setPosition: (self window pointToSpace: anEvent position).
	aBlock value: anEvent
]

{ #category : #accessing }
TextBlocNCursesEventHandler >> enqueue: aBlEvent [
	self window hostSpace enqueueEvent: aBlEvent
]

{ #category : #converting }
TextBlocNCursesEventHandler >> globalMousePositionForEvent: anEvent [
	^ window position + anEvent position
]

{ #category : #'event handling' }
TextBlocNCursesEventHandler >> handleDropMorph: anEvent [
	"| pos |
	pos := anEvent position - self window position.
	anEvent setPosition: pos contents: anEvent contents hand: anEvent hand.
	self enqueue: anEvent"
]

{ #category : #'event handling' }
TextBlocNCursesEventHandler >> handleKeyDown: aMorphicEvent [
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
TextBlocNCursesEventHandler >> handleKeyUp: aMorphicEvent [
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
TextBlocNCursesEventHandler >> handleKeystroke: aMorphicEvent [
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
TextBlocNCursesEventHandler >> handleMouseDown: anEvent [

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
TextBlocNCursesEventHandler >> handleMouseEnter: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TextBlocNCursesEventHandler >> handleMouseLeave: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TextBlocNCursesEventHandler >> handleMouseMove: anEvent [
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
TextBlocNCursesEventHandler >> handleMouseOver: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TextBlocNCursesEventHandler >> handleMouseUp: anEvent [

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
TextBlocNCursesEventHandler >> handleMouseWheel: anEvent [
	
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
TextBlocNCursesEventHandler >> handleWindowClosed: aMorphicEvent [
	| aBlEvent |
	
	aBlEvent := BlSpaceCloseRequest new
		timestamp: DateAndTime now.
	
	self enqueue: aBlEvent
]

{ #category : #'event handling' }
TextBlocNCursesEventHandler >> handleWindowEvent: anEvent [
	
]

{ #category : #'event handling' }
TextBlocNCursesEventHandler >> handleWindowResize: aMorphicEvent [
	| aBlEvent |
	aBlEvent := BlSpaceResizedEvent new
		extent: aMorphicEvent width @ aMorphicEvent height;
		timestamp: DateAndTime now;
		yourself.
	self enqueue: aBlEvent
]

{ #category : #'event handling' }
TextBlocNCursesEventHandler >> transform: aPoint [

	^ (aPoint / (8@16)) floor
]

{ #category : #accessing }
TextBlocNCursesEventHandler >> window [
	^ window
]

{ #category : #accessing }
TextBlocNCursesEventHandler >> window: aBlMorphicWindow [
	window := aBlMorphicWindow
]
