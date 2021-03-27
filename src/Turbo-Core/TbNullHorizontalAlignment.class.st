Class {
	#name : #TbNullHorizontalAlignment,
	#superclass : #TbNullAlignment,
	#classInstVars : [
		'rightToLeft',
		'leftToRight'
	],
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #factory }
TbNullHorizontalAlignment class >> directed: aBlLayoutDirection [
	^ aBlLayoutDirection of: self
]

{ #category : #'class initialization' }
TbNullHorizontalAlignment class >> initialize [
	super initialize.
	
	rightToLeft := TbNullRightAlignment new.
	leftToRight := TbNullLeftAlignment new
]

{ #category : #factory }
TbNullHorizontalAlignment class >> leftToRight [
	^ leftToRight
]

{ #category : #factory }
TbNullHorizontalAlignment class >> rightToLeft [
	^ rightToLeft
]

{ #category : #composition }
TbNullHorizontalAlignment >> + aVerticalAlignment [
	^ TbCompositeAlignment horizontal: self vertical: aVerticalAlignment
]

{ #category : #factory }
TbNullHorizontalAlignment >> directed: aBlLayoutDirection [
	^ self class directed: aBlLayoutDirection
]

{ #category : #factory }
TbNullHorizontalAlignment >> leftToRight [
	^ self class leftToRight
]

{ #category : #factory }
TbNullHorizontalAlignment >> rightToLeft [
	^ self class rightToLeft
]

{ #category : #translation }
TbNullHorizontalAlignment >> translationOf: aBounds in: aContainerBounds [
	^ 0 @ 0
]
