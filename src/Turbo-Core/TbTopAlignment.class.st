Class {
	#name : 'TbTopAlignment',
	#superclass : 'TbVerticalAlignment',
	#category : 'Turbo-Core-Layouts-Support',
	#package : 'Turbo-Core',
	#tag : 'Layouts-Support'
}

{ #category : 'class initialization' }
TbTopAlignment class >> initialize [
	super initialize.
]

{ #category : 'factory' }
TbTopAlignment class >> leftToRight [
	^ self top
]

{ #category : 'factory' }
TbTopAlignment class >> rightToLeft [
	^ self top
]

{ #category : 'factory' }
TbTopAlignment >> inverted [
	^ TbElementAlignment horizontal start
]

{ #category : 'factory' }
TbTopAlignment >> swap [
	^ TbElementAlignment bottom
]

{ #category : 'translation' }
TbTopAlignment >> translationOf: aBounds in: aContainerBounds [
	<return: #Point>
	
	^ 0 @ (aContainerBounds top - aBounds top)
]
