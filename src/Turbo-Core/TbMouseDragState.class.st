Class {
	#name : #TbMouseDragState,
	#superclass : #Object,
	#instVars : [
		'button'
	],
	#category : #'Turbo-Core-Space-Support'
}

{ #category : #comparing }
TbMouseDragState >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	^ anotherObject button = self button
]

{ #category : #accessing }
TbMouseDragState >> button [
	^ button
]

{ #category : #accessing }
TbMouseDragState >> button: anObject [
	button := anObject
]

{ #category : #comparing }
TbMouseDragState >> hash [
	^ self class hash bitXor: self button hash
]
