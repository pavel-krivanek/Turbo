Class {
	#name : 'TbHorizontalCenterAlignment',
	#superclass : 'TbHorizontalAlignment',
	#category : 'Turbo-Core-Layouts-Support',
	#package : 'Turbo-Core',
	#tag : 'Layouts-Support'
}

{ #category : 'class initialization' }
TbHorizontalCenterAlignment class >> initialize [
	super initialize.
]

{ #category : 'factory' }
TbHorizontalCenterAlignment class >> leftToRight [
	^ self center
]

{ #category : 'factory' }
TbHorizontalCenterAlignment class >> rightToLeft [
	^ self center
]

{ #category : 'factory' }
TbHorizontalCenterAlignment >> inverted [
	^ TbElementAlignment vertical center
]

{ #category : 'factory' }
TbHorizontalCenterAlignment >> swap [
	^ self
]

{ #category : 'translation' }
TbHorizontalCenterAlignment >> translationOf: aBounds in: aContainerBounds [
	<return: #Point>
	
	^ ((aContainerBounds width - aBounds width) / 2.0 + aContainerBounds left - aBounds left) @ 0
]
