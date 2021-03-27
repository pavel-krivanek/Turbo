Class {
	#name : #TbKeyDownEvent,
	#superclass : #TbKeyboardEvent,
	#instVars : [
		'key'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #'key - accessing' }
TbKeyDownEvent >> key [
	^ key
]

{ #category : #'key - accessing' }
TbKeyDownEvent >> key: anObject [
	key := anObject
]

{ #category : #printing }
TbKeyDownEvent >> printOn: aStream [
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

{ #category : #sending }
TbKeyDownEvent >> sendTo: anObject [
	anObject keyDownEvent: self
]
