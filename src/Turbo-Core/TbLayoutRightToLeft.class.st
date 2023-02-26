"
I am a concrete right-to-left direction
"
Class {
	#name : #TbLayoutRightToLeft,
	#superclass : #TbLayoutDirection,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #testing }
TbLayoutRightToLeft >> isLeftToRight [
	^ false
]

{ #category : #testing }
TbLayoutRightToLeft >> isRightToLeft [
	^ true
]

{ #category : #dispatch }
TbLayoutRightToLeft >> of: anObject [
	^ anObject rightToLeft
]

{ #category : #enumerating }
TbLayoutRightToLeft >> with: aCollection do: aBlock [
	aCollection reverseDo: aBlock
]

{ #category : #enumerating }
TbLayoutRightToLeft >> with: aCollection inject: thisValue into: binaryBlock [
	"Reversed implementation of Collection>>#inject:into:"
	| nextValue |
	nextValue := thisValue.
	aCollection reverseDo: [ :each | nextValue := binaryBlock value: nextValue value: each ].
	^ nextValue
]
