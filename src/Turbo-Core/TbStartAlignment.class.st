Class {
	#name : 'TbStartAlignment',
	#superclass : 'TbRelativeAlignment',
	#category : 'Turbo-Core-Layouts-Support',
	#package : 'Turbo-Core',
	#tag : 'Layouts-Support'
}

{ #category : 'factory' }
TbStartAlignment class >> horizontal [
	^ TbHorizontalAlignment start
]

{ #category : 'factory' }
TbStartAlignment class >> vertical [
	^ TbVerticalAlignment top
]
