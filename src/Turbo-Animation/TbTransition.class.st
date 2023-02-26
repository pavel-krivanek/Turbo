Class {
	#name : #TbTransition,
	#superclass : #TbAnimation,
	#instVars : [
		'from',
		'to',
		'stepAction'
	],
	#category : #'Turbo-Animation-Animation'
}

{ #category : #pulse }
TbTransition >> applyValue: aValue [
	self stepAction valueWithEnoughArguments: { aValue . self target }
]

{ #category : #accessing }
TbTransition >> from [
	^ from
]

{ #category : #accessing }
TbTransition >> from: anObject [
	from := anObject
]

{ #category : #accessing }
TbTransition >> onStepDo: aBlock [
	stepAction := aBlock
]

{ #category : #accessing }
TbTransition >> stepAction [
	^ stepAction
]

{ #category : #accessing }
TbTransition >> to [
	^ to
]

{ #category : #accessing }
TbTransition >> to: anObject [
	to := anObject
]
