Class {
	#name : #TbNumberTransition,
	#superclass : #TbTransition,
	#instVars : [
		'by',
		'previousValue'
	],
	#category : #'Turbo-Animation-Animation'
}

{ #category : #pulse }
TbNumberTransition >> applyValue: aValue [
	previousValue = aValue
		ifTrue: [ ^ self ].
	previousValue := aValue.
	super applyValue: aValue
]

{ #category : #accessing }
TbNumberTransition >> by: anObject [
	by := anObject
]

{ #category : #pulse }
TbNumberTransition >> valueForStep: aDelta [
	| aValue |
	
	aValue := (to - from) * aDelta + from.
	^ by
		ifNil: [ aValue ]
		ifNotNil: [ (aValue / by) floor * by ]
]
