"
I am a special type of event handler designed to handle keyboard events in order to detect when it is time to perform a shortcut action.
All defined shortcuts are stored in ===BlShortcutRegistry=== which can be accessed using #shortcutRegistry.

I am a part of ===BlSimpleEventDispatcher=== which is a default event dispatcher in ===BlElement===
"
Class {
	#name : #TbShortcutHandler,
	#superclass : #TbBasicEventHandler,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'shortcutRegistry'
	],
	#category : #'Turbo-Core-Events-KeyBinding'
}

{ #category : #accessing }
TbShortcutHandler >> addShortcut: aBlShortcut [
	self shortcuts add: aBlShortcut
]

{ #category : #'private - accessing' }
TbShortcutHandler >> eventClass [ 
 	^ TbShortcutEvent
]

{ #category : #'api - event managing' }
TbShortcutHandler >> handleEvent: aShortcutEvent [
	| matchingShortcuts |

	"no process for repeated key events"
	aShortcutEvent repeat isZero
		ifFalse: [ ^ self ].

	matchingShortcuts := self shortcuts
		select: [ :aShortcut | aShortcut matches: aShortcutEvent buffer ]
		thenCollect: [ :aShortcut | aShortcut -> (aShortcut match: aShortcutEvent buffer) ].
	matchingShortcuts sort: [ :a :b | a value > b value ].

	matchingShortcuts
		ifNotEmpty: [ :theShortcuts |
			| aShortcut |
			aShortcut := theShortcuts first key.
			aShortcut action cull: aShortcut.
			aShortcutEvent consumed: true ]
]

{ #category : #initialization }
TbShortcutHandler >> initialize [
	super initialize.
	shortcutRegistry := TbShortcutRegistry new
]

{ #category : #accessing }
TbShortcutHandler >> shortcutRegistry [
	^ shortcutRegistry 
]

{ #category : #accessing }
TbShortcutHandler >> shortcuts [
	^ self shortcutRegistry shortcuts 
]

{ #category : #'api - event managing' }
TbShortcutHandler >> wantsEvent: anEvent [
	^ anEvent class == self eventClass or: [ anEvent class inheritsFrom: self eventClass ]
]
