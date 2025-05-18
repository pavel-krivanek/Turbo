Class {
	#name : 'TbCompositeAlignment',
	#superclass : 'TbElementAlignment',
	#instVars : [
		'vertical',
		'horizontal',
		'direction'
	],
	#category : 'Turbo-Core-Layouts-Support',
	#package : 'Turbo-Core',
	#tag : 'Layouts-Support'
}

{ #category : 'instance creation' }
TbCompositeAlignment class >> horizontal: aHorizontalAlignent vertical: aVerticalAlignment [
	^ self new
		horizontal: aHorizontalAlignent vertical: aVerticalAlignment;
		yourself
]

{ #category : 'factory' }
TbCompositeAlignment >> directed: aBlLayoutDirection [
	direction := aBlLayoutDirection
]

{ #category : 'accessing' }
TbCompositeAlignment >> horizontal [
	^ horizontal
]

{ #category : 'initialization' }
TbCompositeAlignment >> horizontal: aHorizontalAlignent vertical: aVerticalAlignment [
	horizontal := aHorizontalAlignent.
	vertical := aVerticalAlignment
]

{ #category : 'initialization' }
TbCompositeAlignment >> initialize [
	super initialize.
	
	self leftToRight
]

{ #category : 'factory' }
TbCompositeAlignment >> inverted [
	^ (self class horizontal: (vertical inverted directed: direction) vertical: (horizontal directed: direction) inverted)
		directed: direction;
		yourself
]

{ #category : 'factory' }
TbCompositeAlignment >> leftToRight [
	direction := TbLayoutDirection leftToRight
]

{ #category : 'printing' }
TbCompositeAlignment >> printOn: aStream [
	aStream nextPut: $(.
	horizontal printOn: aStream.
	aStream nextPutAll: ', '.
	vertical printOn: aStream.
	aStream nextPut: $(.
	direction printOn: aStream.
	aStream nextPut: $).
	aStream nextPut: $)
]

{ #category : 'factory' }
TbCompositeAlignment >> rightToLeft [
	direction := TbLayoutDirection rightToLeft
]

{ #category : 'factory' }
TbCompositeAlignment >> swap [
	^ (self class horizontal: horizontal swap vertical: vertical swap)
			directed: direction;
			yourself
]

{ #category : 'translation' }
TbCompositeAlignment >> translationOf: aBounds in: aContainerBounds [
	| h v |
	h := (horizontal directed: direction) translationOf: aBounds in: aContainerBounds.
	v := (vertical directed: direction) translationOf: aBounds in: aContainerBounds.
	^ h + v
]

{ #category : 'accessing' }
TbCompositeAlignment >> vertical [
	^ vertical
]
