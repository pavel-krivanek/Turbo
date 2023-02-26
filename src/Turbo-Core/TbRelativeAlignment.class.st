Class {
	#name : #TbRelativeAlignment,
	#superclass : #TbElementAlignment,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #factory }
TbRelativeAlignment class >> horizontal [
	^ self subclassResponsibility
]

{ #category : #factory }
TbRelativeAlignment class >> oriented: aBlLayoutOrientation [
	^ aBlLayoutOrientation of: self
]

{ #category : #factory }
TbRelativeAlignment class >> vertical [
	^ self subclassResponsibility
]

{ #category : #factory }
TbRelativeAlignment >> horizontal [
	^ self class horizontal
]

{ #category : #factory }
TbRelativeAlignment >> oriented: aBlLayoutOrientation [
	^ self class oriented: aBlLayoutOrientation
]

{ #category : #factory }
TbRelativeAlignment >> vertical [
	^ self class vertical
]
