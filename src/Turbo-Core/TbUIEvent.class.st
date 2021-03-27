Class {
	#name : #TbUIEvent,
	#superclass : #TbEvent,
	#instVars : [
		'position',
		'screenPosition',
		'modifiers',
		'button'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #accessing }
TbUIEvent >> button [
	^ button
]

{ #category : #accessing }
TbUIEvent >> button: anObject [
	button := anObject
]

{ #category : #initialization }
TbUIEvent >> initialize [
	super initialize.
	modifiers := TbKeyModifiers new.
]

{ #category : #'api - geometry' }
TbUIEvent >> localPosition [
	"Return an event position in local coordinates of a #currentTarget"
	<return: #Point>
	
	^ self currentTarget globalPointToLocal: self position
]

{ #category : #accessing }
TbUIEvent >> modifiers [
	<return: #BlKeyModifiers>

	^ modifiers
]

{ #category : #accessing }
TbUIEvent >> modifiers: aBlKeyModifiers [
	 modifiers := aBlKeyModifiers
]

{ #category : #'api - geometry' }
TbUIEvent >> parentPosition [
	"Return an event position in parent coordinates of a #currentTarget"
	<return: #Point>
	
	^ self currentTarget globalPointToParent: self position
]

{ #category : #'api - geometry' }
TbUIEvent >> position [
	^ position
]

{ #category : #accessing }
TbUIEvent >> position: anObject [
	position := anObject
]

{ #category : #printing }
TbUIEvent >> printOn: aStream [
	aStream 
		nextPutAll: self class name;
		nextPut:$(;
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

{ #category : #'api - geometry' }
TbUIEvent >> screenPosition [
	^ screenPosition
]

{ #category : #accessing }
TbUIEvent >> screenPosition: anObject [
	screenPosition := anObject
]
