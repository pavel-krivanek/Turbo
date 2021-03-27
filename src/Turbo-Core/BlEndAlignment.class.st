Class {
	#name : #BlEndAlignment,
	#superclass : #BlRelativeAlignment,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #factory }
BlEndAlignment class >> horizontal [
	^ BlHorizontalAlignment end
]

{ #category : #factory }
BlEndAlignment class >> vertical [
	^ BlVerticalAlignment bottom
]
