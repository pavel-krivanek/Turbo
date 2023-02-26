"
I describe which phase the event flow is currently being evaluated.
"
Class {
	#name : #TbEventTraversalStep,
	#superclass : #Object,
	#instVars : [
		'target'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #accessing }
TbEventTraversalStep class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #accessing }
TbEventTraversalStep >> dispatcher [
	^ self target eventDispatcher
]

{ #category : #printing }
TbEventTraversalStep >> printOn: stream [
	super printOn: stream.
	self target ifNotNil: [ 
		stream nextPut: $(.
		self target printOn: stream.
		stream nextPut: $). ]
]

{ #category : #accessing }
TbEventTraversalStep >> target [
	^ target
]

{ #category : #accessing }
TbEventTraversalStep >> target: anObject [
	target := anObject
]

{ #category : #accessing }
TbEventTraversalStep >> type [
	<return: #String>
	
	^ self subclassResponsibility
]
