"
element := TextBlocHelloElement new.

space := BlSpace new.
space extent: 50@50.
space root addChild: element.

universe := BlUniverse new.
universe pulseLoop: (TextBlocPulseLoop new 
	universe: universe;
	yourself).

host := TextBlocMorphicHost new.
space host: host.
universe spaceManager addSpace: space.

space host createHostSpaceFor: space.
space hostSpace show.

universe start.
space dispatchEvent: (BlSpaceShownEvent new space: universe).


"
Class {
	#name : #TextBlocMorphicWindow,
	#superclass : #StandardWindow,
	#instVars : [
		'eventHandler',
		'hostSpace',
		'preventResize',
		'spaceMorph'
	],
	#category : #'TextBloc-Morphic'
}

{ #category : #testing }
TextBlocMorphicWindow >> handleKeystroke: anEvent [
	anEvent sentTo: eventHandler
]

{ #category : #testing }
TextBlocMorphicWindow >> handlesKeyboard: evt [
	^ true
]

{ #category : #testing }
TextBlocMorphicWindow >> hostSpace [
	^ hostSpace
]

{ #category : #testing }
TextBlocMorphicWindow >> hostSpace: aHostSpace [
	
	hostSpace := aHostSpace.
	spaceMorph hostSpace: aHostSpace.
	
	self initializeAnnouncement
]

{ #category : #testing }
TextBlocMorphicWindow >> initialize [
	super initialize.

	spaceMorph := TextBlocMorphicSpaceMorph new.
	self addMorph: spaceMorph fullFrame: LayoutFrame identity. 
	eventHandler := TextBlocMorphicEventHandler window: self.
	preventResize := false.
]

{ #category : #testing }
TextBlocMorphicWindow >> initializeAnnouncement [
	
	self
		onAnnouncement: WindowOpened
		do: [ :evt | spaceMorph startStepping ].

	self
		onAnnouncement: WindowClosed
		do: [ :evt | spaceMorph stopStepping. "BlMorphicWindowCloseEvent new sentTo: eventHandler "].
		
	self
		onAnnouncement: MorphGotFocus
		do: [ :evt | ].
		
	self
		onAnnouncement: MorphLostFocus
		do: [ :evt | ].

"	self
		onAnnouncement: WindowResizing
		do: [ :evt | 
			self resizeDuring: [ BlMorphicWindowResizeEvent new
				width: self spaceExtent x;
				height: self spaceExtent y;
				sentTo: eventHandler ] ]"
]

{ #category : #testing }
TextBlocMorphicWindow >> isInSpaceArea: anEvent [
	"Return true if given morphic event is within space area, false otherwise"
	<return: #Boolean>
	
	^ spaceMorph fullBounds containsPoint: anEvent position
]

{ #category : #testing }
TextBlocMorphicWindow >> keyDown: anEvent [
	anEvent sentTo: eventHandler
]

{ #category : #testing }
TextBlocMorphicWindow >> keyUp: anEvent [
	anEvent sentTo: eventHandler
]

{ #category : #testing }
TextBlocMorphicWindow >> pointToSpace: aPoint [

	^ aPoint - self spacePosition
]

{ #category : #testing }
TextBlocMorphicWindow >> processEvent: anEvent using: defaultDispatcher [
	
	(self isInSpaceArea: anEvent)
		ifFalse: [ ^ super processEvent: anEvent using: defaultDispatcher ].

	anEvent sentTo: eventHandler.
	
	"quick fix for issue #15 : 
	In morphic, if the drop event is mark as handled, the dragged window is removed"
	anEvent isDropEvent
		ifFalse: [ anEvent wasHandled: true ]
]

{ #category : #geometry }
TextBlocMorphicWindow >> resizeDuring: aBlock [
	
	preventResize
		ifTrue: [ ^ self ].
	
	preventResize := true.
	aBlock ensure: [ preventResize := false ]
]

{ #category : #geometry }
TextBlocMorphicWindow >> spaceExtent [
	| aDelta |
	
	"we compute decorations extent first"
	aDelta := self fullBounds extent - spaceMorph extent.
	^ self extent - aDelta
]

{ #category : #geometry }
TextBlocMorphicWindow >> spaceExtent: anExtent [

	self resizeDuring: [
		self spaceExtent = anExtent
			ifFalse: [
				| aDelta |
				"we compute decorations extent first"
				aDelta := self fullBounds extent - spaceMorph extent.
				super extent: anExtent + aDelta ] ]
]

{ #category : #geometry }
TextBlocMorphicWindow >> spaceForm [

	^ spaceMorph
]

{ #category : #testing }
TextBlocMorphicWindow >> spacePosition [
	"Return position of space area"
	<return: #Point>

	^ spaceMorph position
]

{ #category : #testing }
TextBlocMorphicWindow >> takesKeyboardFocus [
	"Answer whether the receiver can normally take keyboard focus."

	^ true
]

{ #category : #testing }
TextBlocMorphicWindow >> wantsKeyboardFocus [
	"Answer whether the receiver would like keyboard focus
	in the general case (mouse action normally)."

	^ true
]
