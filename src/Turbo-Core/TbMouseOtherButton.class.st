"
I represent all other mouse buttons that are not primary, middle or context.
Nowadays there can be any number of mouse buttons, we have to support them
"
Class {
	#name : #TbMouseOtherButton,
	#superclass : #TbMouseButton,
	#instVars : [
		'code'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #'instance creation' }
TbMouseOtherButton class >> code: aNumber [
	^ self new code: aNumber
]

{ #category : #comparing }
TbMouseOtherButton >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	^ anotherObject code = self code
]

{ #category : #accessing }
TbMouseOtherButton >> code [
	"Return a numerical (integer) code of this mouse button"
	<return: #Number>

	^ code
]

{ #category : #accessing }
TbMouseOtherButton >> code: aNumber [

	self
		assert: [ code isNil ]
		description: [ 'Mouse button is immutable, create a new instance with the code' ].

	code := aNumber
]

{ #category : #comparing }
TbMouseOtherButton >> hash [
	^ self class hash bitXor: self code hash
]
