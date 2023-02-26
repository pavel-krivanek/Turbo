Class {
	#name : #TbGridFlexibility,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Turbo-Layout-Grid-Utilities'
}

{ #category : #factory }
TbGridFlexibility class >> canStretch [
	^ TbGridCanStretch uniqueInstance
]

{ #category : #cleanup }
TbGridFlexibility class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #factory }
TbGridFlexibility class >> inflexible [
	^ TbGridInflexible uniqueInstance
]

{ #category : #accessing }
TbGridFlexibility class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #comparing }
TbGridFlexibility >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : #comparing }
TbGridFlexibility >> and: aFlexibility [
	^ self subclassResponsibility
]

{ #category : #comparing }
TbGridFlexibility >> andCanStretch: aFlexibility [
	^ self subclassResponsibility
]

{ #category : #comparing }
TbGridFlexibility >> andInflexible: aFlexibility [
	^ self subclassResponsibility
]

{ #category : #comparing }
TbGridFlexibility >> hash [
	^ self class hash
]
