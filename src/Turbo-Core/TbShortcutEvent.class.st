"
Is sent by Keyboard processor to currently focused element in order to allow it to detect if any shortcuts are triggered based on currently pressed key stored in a buffer.

Public API and Key Messages

- buffer return a ===BlKeyboardBuffer=== that knows what keys are pressed at the moment.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	buffer:		<BlKeyboardBuffer>

    Implementation Points

I must be set to ===consumed=== if there was a matching shortcut.
"
Class {
	#name : 'TbShortcutEvent',
	#superclass : 'TbKeyboardEvent',
	#instVars : [
		'buffer',
		'isRepeated'
	],
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'accessing' }
TbShortcutEvent >> beRepeated [
	isRepeated := true
]

{ #category : 'accessing' }
TbShortcutEvent >> buffer [
	^ buffer
]

{ #category : 'accessing' }
TbShortcutEvent >> buffer: anObject [
	buffer := anObject
]

{ #category : 'initialization' }
TbShortcutEvent >> initialize [
	super initialize.
	
	isRepeated := false
]

{ #category : 'accessing' }
TbShortcutEvent >> isRepeated [
	"Return true if this shortcut is a repeated event giving handlers a chance to ignore such shortcuts"
	<return: #Boolean>

	^ isRepeated
]

{ #category : 'sending' }
TbShortcutEvent >> sendTo: anObject [
	anObject shortcutEvent: self
]
