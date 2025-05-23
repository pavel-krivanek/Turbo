"
I represent left alignment.
See BlLayoutAlignment for more info.
"
Class {
	#name : 'TbLeftAlignment',
	#superclass : 'TbHorizontalAlignment',
	#category : 'Turbo-Core-Layouts-Support',
	#package : 'Turbo-Core',
	#tag : 'Layouts-Support'
}

{ #category : 'class initialization' }
TbLeftAlignment class >> initialize [
	super initialize.
]

{ #category : 'factory' }
TbLeftAlignment class >> leftToRight [
	^ self left
]

{ #category : 'factory' }
TbLeftAlignment class >> rightToLeft [
	^ self right
]

{ #category : 'factory' }
TbLeftAlignment >> inverted [
	^ TbElementAlignment vertical start
]

{ #category : 'factory' }
TbLeftAlignment >> swap [
	^ TbElementAlignment right
]

{ #category : 'translation' }
TbLeftAlignment >> translationOf: aBounds in: aContainerBounds [
	<return: #Point>

	^ (aContainerBounds left - aBounds left) @ 0
]
