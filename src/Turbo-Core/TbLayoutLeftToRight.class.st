"
I am a concrete left-to-right direction
"
Class {
	#name : #TbLayoutLeftToRight,
	#superclass : #TbLayoutDirection,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #testing }
TbLayoutLeftToRight >> isLeftToRight [
	^ true
]

{ #category : #testing }
TbLayoutLeftToRight >> isRightToLeft [
	^ false
]

{ #category : #dispatch }
TbLayoutLeftToRight >> of: anObject [
	^ anObject leftToRight
]

{ #category : #enumerating }
TbLayoutLeftToRight >> with: aCollection do: aBlock [
	aCollection do: aBlock
]

{ #category : #enumerating }
TbLayoutLeftToRight >> with: aCollection inject: thisValue into: binaryBlock [
	^ aCollection inject: thisValue into: binaryBlock
]
