Class {
	#name : #TbLookProperty,
	#superclass : #TbObjectProperty,
	#instVars : [
		'invalidateBlock',
		'whenBlock'
	],
	#category : #'Turbo-Core-Property'
}

{ #category : #'instance creation' }
TbLookProperty class >> on: anOwner named: aSymbol default: aValue invalidated: anInvalidatedBlock when: aWhenBlock [
	^ self new
		name: aSymbol;
		owner: anOwner;
		rawValue: aValue;
		invalidated: anInvalidatedBlock;
		when: aWhenBlock;
		yourself
]

{ #category : #initialization }
TbLookProperty >> initialize [
	super initialize.
	
	invalidateBlock := [  ].
	whenBlock := [ true ]
]

{ #category : #'change management' }
TbLookProperty >> invalidated [
	(whenBlock cull: self owner)
		ifTrue: [ invalidateBlock cull: self owner ]
]

{ #category : #scripting }
TbLookProperty >> invalidated: aBlock [
	invalidateBlock := aBlock
]

{ #category : #scripting }
TbLookProperty >> when: aBlock [
	whenBlock := aBlock
]
