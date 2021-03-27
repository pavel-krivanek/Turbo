Class {
	#name : #BlStartAlignment,
	#superclass : #BlRelativeAlignment,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #factory }
BlStartAlignment class >> horizontal [
	^ BlHorizontalAlignment start
]

{ #category : #factory }
BlStartAlignment class >> vertical [
	^ BlVerticalAlignment top
]
