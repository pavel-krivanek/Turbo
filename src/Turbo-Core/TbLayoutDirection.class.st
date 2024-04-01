"
I represent an abstract layout direction.

There are left-to-right (LTR) and right-to-left (RTL) languages. Language direction influences the alignement of elments within layouts.
I do not have any logic and can only used as direction flag. Layouts that have direction specific logic should impelment their own object oriented mechanism
"
Class {
	#name : #TbLayoutDirection,
	#superclass : #Object,
	#classVars : [
		'leftToRight',
		'rightToLeft'
	],
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #'class initialization' }
TbLayoutDirection class >> initialize [
	super initialize.
	
	leftToRight := TbLayoutLeftToRight new.
	rightToLeft := TbLayoutRightToLeft new
]

{ #category : #factory }
TbLayoutDirection class >> leftToRight [
	^ leftToRight
]

{ #category : #factory }
TbLayoutDirection class >> rightToLeft [
	^ rightToLeft
]

{ #category : #testing }
TbLayoutDirection >> isLeftToRight [
	^ self subclassResponsibility
]

{ #category : #testing }
TbLayoutDirection >> isRightToLeft [
	^ self subclassResponsibility
]

{ #category : #dispatch }
TbLayoutDirection >> of: anObject [
	^ self subclassResponsibility
]

{ #category : #enumerating }
TbLayoutDirection >> with: aCollection do: aBlock [
	^ self subclassResponsibility
]

{ #category : #enumerating }
TbLayoutDirection >> with: aCollection inject: thisValue into: binaryBlock [
	^ self subclassResponsibility
]
