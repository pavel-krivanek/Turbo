Class {
	#name : #TbVTEEventHandler,
	#superclass : #Object,
	#instVars : [
		'hostSpace',
		'surface'
	],
	#category : #'Turbo-VTE'
}

{ #category : #'as yet unclassified' }
TbVTEEventHandler class >> window: aMorphicWindow [
	^ self new
		window: aMorphicWindow;
		yourself
]

{ #category : #accessing }
TbVTEEventHandler >> clear [


]

{ #category : #converting }
TbVTEEventHandler >> convertButtonFromMouseButtonEvent: aMorphicEvent [

	aMorphicEvent redButtonChanged
		ifTrue: [ ^BlMouseButton primary ].
	aMorphicEvent blueButtonChanged
		ifTrue: [ ^ BlMouseButton middle ].
	aMorphicEvent yellowButtonChanged
		ifTrue: [ ^ BlMouseButton secondary ].
		
	^ aMorphicEvent whichButton
]

{ #category : #converting }
TbVTEEventHandler >> convertButtonFromMouseEvent: aMorphicEvent [

	aMorphicEvent redButtonPressed
		ifTrue: [ ^ BlMouseEvent primaryButton ].
	aMorphicEvent blueButtonPressed
		ifTrue: [ ^ BlMouseEvent middleButton ].
	aMorphicEvent yellowButtonPressed
		ifTrue: [ ^ BlMouseEvent secondaryButton ].
		
	^ aMorphicEvent buttons
]

{ #category : #converting }
TbVTEEventHandler >> convertKeyModifiersFromEvent: aMorphicEvent [ 
	| shift ctrl alt cmd |

	shift := aMorphicEvent shiftPressed.
	ctrl := aMorphicEvent controlKeyPressed.
	alt := aMorphicEvent altKeyPressed.
	cmd := aMorphicEvent commandKeyPressed.
	
	^ BlKeyModifiers shift: shift ctrl: ctrl alt: alt cmd: cmd
]

{ #category : #'event handling' }
TbVTEEventHandler >> convertMousePosition: anEvent andDo: aBlock [

	"changes event position to be relative to the panelRect, not to the world"
	anEvent setPosition: (self window pointToSpace: anEvent position).
	aBlock value: anEvent
]

{ #category : #accessing }
TbVTEEventHandler >> enqueue: aBlEvent [
	self hostSpace enqueueEvent: aBlEvent
]

{ #category : #converting }
TbVTEEventHandler >> globalMousePositionForEvent: anEvent [
	^ window position + anEvent position
]

{ #category : #'event handling' }
TbVTEEventHandler >> handleDropMorph: anEvent [
	"| pos |
	pos := anEvent position - self window position.
	anEvent setPosition: pos contents: anEvent contents hand: anEvent hand.
	self enqueue: anEvent"
]

{ #category : #'event handling' }
TbVTEEventHandler >> handleKeyDown: aMorphicEvent [
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
TbVTEEventHandler >> handleKeyUp: aMorphicEvent [
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
TbVTEEventHandler >> handleKeystroke: aMorphicEvent [
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
TbVTEEventHandler >> handleMouseDown: anEvent [

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
TbVTEEventHandler >> handleMouseEnter: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TbVTEEventHandler >> handleMouseLeave: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TbVTEEventHandler >> handleMouseMove: anEvent [

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
TbVTEEventHandler >> handleMouseOver: anEvent [
	self convertMousePosition: anEvent andDo: [ :aMorphicEvent | ]
]

{ #category : #'event handling' }
TbVTEEventHandler >> handleMouseUp: anEvent [

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
TbVTEEventHandler >> handleMouseWheel: anEvent [
	
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
TbVTEEventHandler >> handleWindowClosed: aMorphicEvent [
	| aBlEvent |
	
	aBlEvent := TbSpaceCloseRequest new
		timestamp: DateAndTime now.
	
	self enqueue: aBlEvent
]

{ #category : #'event handling' }
TbVTEEventHandler >> handleWindowEvent: anEvent [
	
]

{ #category : #'event handling' }
TbVTEEventHandler >> handleWindowResize: aMorphicEvent [
	| aBlEvent |
	aBlEvent := TbSpaceResizedEvent new
		extent: aMorphicEvent width @ aMorphicEvent height;
		timestamp: DateAndTime now;
		yourself.
	self enqueue: aBlEvent
]

{ #category : #accessing }
TbVTEEventHandler >> hostSpace [
	^ hostSpace
]

{ #category : #accessing }
TbVTEEventHandler >> hostSpace: anObject [
	hostSpace := anObject
]

{ #category : #'event handling' }
TbVTEEventHandler >> initialize [ 

	super initialize.
]

{ #category : #accessing }
TbVTEEventHandler >> pulse [ 

	self readInput.
]

{ #category : #accessing }
TbVTEEventHandler >> readInput [

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
TbVTEEventHandler >> surface [

	^ surface
]

{ #category : #accessing }
TbVTEEventHandler >> surface: anObject [

	surface := anObject
]

{ #category : #'event handling' }
TbVTEEventHandler >> transform: aPoint [

	^ (aPoint / (8@16)) floor
]

{ #category : #'event handling' }
TbVTEEventHandler >> transformPoint: aPoint [
 
	 ^ surface transformPoint: aPoint

]

{ #category : #accessing }
TbVTEEventHandler >> window [
	^ window
]

{ #category : #accessing }
TbVTEEventHandler >> window: aBlMorphicWindow [
	window := aBlMorphicWindow
]
