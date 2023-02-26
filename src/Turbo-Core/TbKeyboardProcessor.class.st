Class {
	#name : #TbKeyboardProcessor,
	#superclass : #TbBaseEventProcessor,
	#instVars : [
		'buffer',
		'preventKeystrokes',
		'shortcutRepeatDelay',
		'shortcutRepeatInterval',
		'previousShortcutTime',
		'previousShortcutRepeatTime'
	],
	#category : #'Turbo-Core-Space-Support'
}

{ #category : #accessing }
TbKeyboardProcessor >> buffer [
	<return: #BlKeyboardBuffer>

	^ buffer
]

{ #category : #'target detection' }
TbKeyboardProcessor >> findTarget: anEvent [
	"Find and return an appropriate element target for a given keyboard event.
	By default a keyboard event target is currently focused element if exists
	or space's root element otherwise.
	Note: target can not be nil"
	<return: #BlElement>

	^ (self space focusProcessor hasFocusOwner and: [ self space focusProcessor focusOwner isAttachedToSceneGraph ])
		ifTrue: [ self space focusProcessor focusOwner ]
		ifFalse: [ self space root ]
]

{ #category : #'event processing' }
TbKeyboardProcessor >> handleSpaceEventProcessedEvent: anEvent [
	| aShortcutEvent aTimeNow |
	
	self buffer isEmpty
		ifTrue: [ ^ self ].
	
	aTimeNow := self space time now.
	
	(aTimeNow - previousShortcutTime) < shortcutRepeatDelay
		ifTrue: [ ^ self ].

	(aTimeNow - previousShortcutRepeatTime) < shortcutRepeatInterval
		ifTrue: [ ^ self ].
	
	aShortcutEvent := TbShortcutEvent new.
	aShortcutEvent beRepeated.
	aShortcutEvent buffer: self buffer.
	aShortcutEvent target: (self findTarget: anEvent).
	self fireEvent: aShortcutEvent.

	previousShortcutRepeatTime := self space time now
]

{ #category : #initialization }
TbKeyboardProcessor >> initialize [
	super initialize.
	
	buffer := TbKeyboardBuffer new.
	preventKeystrokes := false.

	shortcutRepeatInterval := 100 milliSeconds. "how often a shortcut even should be sent while user still presses keys"
	shortcutRepeatDelay := 500 milliSeconds. "how much we should wait until starting to repeat a shortcut"

	previousShortcutTime := DateAndTime now. "when the previous main shortcut event was sent"
	previousShortcutRepeatTime := DateAndTime now. "when the last repeated shortcut was sent"
]

{ #category : #testing }
TbKeyboardProcessor >> keystrokesAllowed [
	"Return true if keystrokes are allowed, false otherwise"
	<return: #Boolean>

	^ preventKeystrokes not
]

{ #category : #'event processing' }
TbKeyboardProcessor >> processKeyDown: anEvent [
	| aTarget aShortcutEvent |

	(self buffer hasEvent: anEvent key)
		ifTrue: [ ^ self ].

	self buffer add: anEvent.
	
	aTarget := self findTarget: anEvent.
	anEvent target: aTarget.
	self fireEvent: anEvent.

	aShortcutEvent := TbShortcutEvent new.
	aShortcutEvent buffer: self buffer.
	aShortcutEvent target: aTarget.
	self fireEvent: aShortcutEvent.
	previousShortcutTime := self space time now.

	preventKeystrokes := aShortcutEvent isConsumed
]

{ #category : #'event processing' }
TbKeyboardProcessor >> processKeyUp: anEvent [
	| aTarget |

	(self buffer hasEvent: anEvent key)
		ifFalse: [ ^ self ].
	
	self buffer remove: anEvent.
	
	aTarget := self findTarget: anEvent.
	anEvent target: aTarget.
	self fireEvent: anEvent
]

{ #category : #'event processing' }
TbKeyboardProcessor >> processKeystroke: anEvent [
	| aTarget |
	
	self keystrokesAllowed
		ifFalse: [ ^ self ].

	aTarget := self findTarget: anEvent.
	anEvent target: aTarget.
	self fireEvent: anEvent.
]

{ #category : #'event processing' }
TbKeyboardProcessor >> processTextInput: anEvent [
	| aTarget |
	
	aTarget := self findTarget: anEvent.
	anEvent target: aTarget.
	self fireEvent: anEvent.
]
