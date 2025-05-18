Class {
	#name : 'TbKeyUpEvent',
	#superclass : 'TbKeyboardEvent',
	#instVars : [
		'key'
	],
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'key - accessing' }
TbKeyUpEvent >> key [
	^ key
]

{ #category : 'key - accessing' }
TbKeyUpEvent >> key: anObject [
	key := anObject
]

{ #category : 'printing' }
TbKeyUpEvent >> printOn: aStream [
	aStream 
		nextPutAll: self class name;
		nextPut:$(;
		nextPutAll:'key: ';
		print: key;
		nextPutAll:'position: ';
		print: position;
		nextPutAll:'; screenPosition: ';
		print: screenPosition;
		nextPutAll:'; modifiers: ';
		print: modifiers;
		nextPutAll:'; button: ';
		print: button;
		nextPut:$)
]

{ #category : 'sending' }
TbKeyUpEvent >> sendTo: anObject [
	anObject keyUpEvent: self
]
