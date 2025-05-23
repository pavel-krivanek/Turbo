"
I represent a keyboard shortcut that can be registered to any arbitrary ===BlElement===
I consist of an Action that is evaluated when a Shortcut is triggered and ===BlKeyCombination=== that describes when shortcut should be triggered. A combination is a logical formula expression that is composed of various key combinations such as alternative, compulsory or single key. See subclasses of ===BlKeyCombination===.
Additionally, shortcut may provide its optional textual description and name.

All shortcuts of an element are stored in ===BlShortcutRegistry=== and matched / triggered by ===BlShortcutHandler===

A shortcut can be added or removed from the element by using #addShortcut: or #removeShortcut: methods.
#shortcuts message can be sent to an element in order to access a list of all registered shortcuts.

Public API and Key Messages

- combination: get /set shortcut's key combination
- action: get / set action should be executed when shortcut is triggered
- description: get / set shortcut's description text
- name: get / set a name of a shortcut

Example of a shortcut that is triggered when user presses shift + meta + arrowLeft:

   BlShortcut new
	combination: (BlKeyCombination builder shift; meta; key: Key arrowLeft; build);
	action: [ :aShortcut | self inform: 'Triggered ', aShortcut combination asString ]
 
Internal Representation and Key Implementation Points.

    Instance Variables
	action:		<Object>
	combination:		<BlKeyCombination>
	description:		<Object>
	name:		<Object>
"
Class {
	#name : 'TbShortcut',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'name',
		'description',
		'combination',
		'action'
	],
	#category : 'Turbo-Core-Events-KeyBinding',
	#package : 'Turbo-Core',
	#tag : 'Events-KeyBinding'
}

{ #category : 'accessing' }
TbShortcut >> action [
	^ action
]

{ #category : 'accessing' }
TbShortcut >> action: anObject [
	self
		assert: [ anObject isNotNil ]
		description: [ 'Action must not be nil' ].

	action := anObject
]

{ #category : 'accessing' }
TbShortcut >> combination [
	^ combination
]

{ #category : 'accessing' }
TbShortcut >> combination: anObject [
	combination := anObject
]

{ #category : 'accessing' }
TbShortcut >> description [
	^ description
]

{ #category : 'accessing' }
TbShortcut >> description: anObject [
	description := anObject
]

{ #category : 'key matching' }
TbShortcut >> match: anEventBuffer [
	^ self combination match: anEventBuffer
]

{ #category : 'key matching' }
TbShortcut >> matches: anKeyboardBuffer [
	^ self combination matches: anKeyboardBuffer
]

{ #category : 'accessing' }
TbShortcut >> name [
	^ name
]

{ #category : 'accessing' }
TbShortcut >> name: anObject [
	name := anObject
]

{ #category : 'printing' }
TbShortcut >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self name ifNotNil: [ 
		aStream 
			nextPutAll: self name;
			nextPutAll: ', ' ].
	self combination printOn: aStream.
	aStream nextPut: $).
]
