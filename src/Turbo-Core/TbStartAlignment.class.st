Class {
	#name : #TbStartAlignment,
	#superclass : #TbRelativeAlignment,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #factory }
TbStartAlignment class >> horizontal [
	^ TbHorizontalAlignment start
]

{ #category : #factory }
TbStartAlignment class >> vertical [
	^ TbVerticalAlignment top
]
