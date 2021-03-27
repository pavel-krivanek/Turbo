"
I represent middle alignment.
See BlLayoutAlignment for more info.
"
Class {
	#name : #TbMiddleAlignment,
	#superclass : #TbRelativeAlignment,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #factory }
TbMiddleAlignment class >> horizontal [
	^ BlHorizontalAlignment center
]

{ #category : #factory }
TbMiddleAlignment class >> vertical [
	^ BlVerticalAlignment center
]
