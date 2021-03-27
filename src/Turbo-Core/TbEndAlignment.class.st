Class {
	#name : #TbEndAlignment,
	#superclass : #TbRelativeAlignment,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #factory }
TbEndAlignment class >> horizontal [
	^ BlHorizontalAlignment end
]

{ #category : #factory }
TbEndAlignment class >> vertical [
	^ BlVerticalAlignment bottom
]
