"
I am sent between key down and key up events. I can be repeated while user holds a key pressed.
"
Class {
	#name : 'TbKeystrokeEvent',
	#superclass : 'TbKeyboardEvent',
	#instVars : [
		'char'
	],
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'key - accessing' }
TbKeystrokeEvent >> char [
	^ char
]

{ #category : 'key - accessing' }
TbKeystrokeEvent >> char: anObject [
	char := anObject
]

{ #category : 'sending' }
TbKeystrokeEvent >> sendTo: anObject [
	anObject keystrokeEvent: self
]
