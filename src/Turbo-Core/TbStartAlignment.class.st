Class {
	#name : #TbStartAlignment,
	#superclass : #TbRelativeAlignment,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #factory }
TbStartAlignment class >> horizontal [
	^ BlHorizontalAlignment start
]

{ #category : #factory }
TbStartAlignment class >> vertical [
	^ BlVerticalAlignment top
]
