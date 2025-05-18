Class {
	#name : 'TbEndAlignment',
	#superclass : 'TbRelativeAlignment',
	#category : 'Turbo-Core-Layouts-Support',
	#package : 'Turbo-Core',
	#tag : 'Layouts-Support'
}

{ #category : 'factory' }
TbEndAlignment class >> horizontal [
	^ TbHorizontalAlignment end
]

{ #category : 'factory' }
TbEndAlignment class >> vertical [
	^ TbVerticalAlignment bottom
]
