"
I represent middle alignment.
See BlLayoutAlignment for more info.
"
Class {
	#name : 'TbMiddleAlignment',
	#superclass : 'TbRelativeAlignment',
	#category : 'Turbo-Core-Layouts-Support',
	#package : 'Turbo-Core',
	#tag : 'Layouts-Support'
}

{ #category : 'factory' }
TbMiddleAlignment class >> horizontal [
	^ TbHorizontalAlignment center
]

{ #category : 'factory' }
TbMiddleAlignment class >> vertical [
	^ TbVerticalAlignment center
]
