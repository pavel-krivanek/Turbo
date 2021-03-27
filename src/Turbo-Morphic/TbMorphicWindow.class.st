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
	#name : #TbMorphicWindow,
	#superclass : #StandardWindow,
	#instVars : [
		'eventHandler',
		'hostSpace',
		'preventResize',
		'spaceMorph'
	],
	#category : #'Turbo-Morphic'
}

{ #category : #testing }
TbMorphicWindow >> handleKeystroke: anEvent [
	anEvent sentTo: eventHandler
]

{ #category : #testing }
TbMorphicWindow >> handlesKeyboard: evt [
	^ true
]

{ #category : #testing }
TbMorphicWindow >> hostSpace [
	^ hostSpace
]

{ #category : #testing }
TbMorphicWindow >> hostSpace: aHostSpace [
	
	hostSpace := aHostSpace.
	spaceMorph hostSpace: aHostSpace.
	
	self initializeAnnouncement
]

{ #category : #testing }
TbMorphicWindow >> initialize [
	super initialize.

	spaceMorph := TextBlocMorphicSpaceMorph new.
	self addMorph: spaceMorph fullFrame: LayoutFrame identity. 
	eventHandler := TextBlocMorphicEventHandler window: self.
	preventResize := false.
]

{ #category : #testing }
TbMorphicWindow >> initializeAnnouncement [
	
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
TbMorphicWindow >> isInSpaceArea: anEvent [
	"Return true if given morphic event is within space area, false otherwise"
	<return: #Boolean>
	
	^ spaceMorph fullBounds containsPoint: anEvent position
]

{ #category : #testing }
TbMorphicWindow >> keyDown: anEvent [
	anEvent sentTo: eventHandler
]

{ #category : #testing }
TbMorphicWindow >> keyUp: anEvent [
	anEvent sentTo: eventHandler
]

{ #category : #testing }
TbMorphicWindow >> pointToSpace: aPoint [

	^ aPoint - self spacePosition
]

{ #category : #testing }
TbMorphicWindow >> processEvent: anEvent using: defaultDispatcher [
	
	(self isInSpaceArea: anEvent)
		ifFalse: [ ^ super processEvent: anEvent using: defaultDispatcher ].

	anEvent sentTo: eventHandler.
	
	"quick fix for issue #15 : 
	In morphic, if the drop event is mark as handled, the dragged window is removed"
	anEvent isDropEvent
		ifFalse: [ anEvent wasHandled: true ]
]

{ #category : #geometry }
TbMorphicWindow >> resizeDuring: aBlock [
	
	preventResize
		ifTrue: [ ^ self ].
	
	preventResize := true.
	aBlock ensure: [ preventResize := false ]
]

{ #category : #geometry }
TbMorphicWindow >> spaceExtent [
	| aDelta |
	
	"we compute decorations extent first"
	aDelta := self fullBounds extent - spaceMorph extent.
	^ self extent - aDelta
]

{ #category : #geometry }
TbMorphicWindow >> spaceExtent: anExtent [

	self resizeDuring: [
		self spaceExtent = anExtent
			ifFalse: [
				| aDelta |
				"we compute decorations extent first"
				aDelta := self fullBounds extent - spaceMorph extent.
				super extent: anExtent + aDelta ] ]
]

{ #category : #geometry }
TbMorphicWindow >> spaceForm [

	^ spaceMorph
]

{ #category : #testing }
TbMorphicWindow >> spacePosition [
	"Return position of space area"
	<return: #Point>

	^ spaceMorph position
]

{ #category : #testing }
TbMorphicWindow >> takesKeyboardFocus [
	"Answer whether the receiver can normally take keyboard focus."

	^ true
]

{ #category : #testing }
TbMorphicWindow >> wantsKeyboardFocus [
	"Answer whether the receiver would like keyboard focus
	in the general case (mouse action normally)."

	^ true
]
