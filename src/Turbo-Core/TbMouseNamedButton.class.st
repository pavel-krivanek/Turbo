"
I am a root class of all mouse buttons with a name, e.g. ""primary"", ""secondary"" or ""middle""
"
Class {
	#name : 'TbMouseNamedButton',
	#superclass : 'TbMouseButton',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'cleanup' }
TbMouseNamedButton class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : 'accessing' }
TbMouseNamedButton class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : 'comparing' }
TbMouseNamedButton >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	^ anotherObject isKindOf: self class
]

{ #category : 'comparing' }
TbMouseNamedButton >> hash [
	^ self class hash
]
