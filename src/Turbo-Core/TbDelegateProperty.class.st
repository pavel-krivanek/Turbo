Class {
	#name : #TbDelegateProperty,
	#superclass : #TbObjectProperty,
	#instVars : [
		'property',
		'delegationBlock'
	],
	#category : #'Turbo-Core-Property'
}

{ #category : #'as yet unclassified' }
TbDelegateProperty class >> on: anOwner named: aSymbol delegateTo: aProperty [ 
	^ self new
		name: aSymbol;
		owner: anOwner;
		delegateTo: aProperty;
		yourself
]

{ #category : #'as yet unclassified' }
TbDelegateProperty class >> on: anOwner named: aSymbol delegateTo: aProperty do: aDelegationBlock [
	^ self new
		name: aSymbol;
		owner: anOwner;
		delegateTo: aProperty;
		do: aDelegationBlock;
		yourself
]

{ #category : #delegation }
TbDelegateProperty >> delegateTo: aProperty [
	aProperty addChangeListener: self.
	property := aProperty.
	
]

{ #category : #enumerating }
TbDelegateProperty >> do: aDelegationBlock [
	delegationBlock := aDelegationBlock
]

{ #category : #accessing }
TbDelegateProperty >> initialize [
	super initialize.
	delegationBlock := [ :p :v | 
		(p perform: self name) = v ifFalse: [
			p perform: self name asMutator with: v ] ]
]

{ #category : #'change management' }
TbDelegateProperty >> invalidated [
	property value ifNotNil: [ :o | delegationBlock value: o value: self rawValue ]
]

{ #category : #accessing }
TbDelegateProperty >> valueChanged: anObject [
	anObject ifNil:[^ self].
	delegationBlock value: anObject value: self rawValue
]
