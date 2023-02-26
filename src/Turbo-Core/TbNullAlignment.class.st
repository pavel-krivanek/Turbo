"
I represent null alignment which is default one.
See BlLayoutAlignment for more info.
"
Class {
	#name : #TbNullAlignment,
	#superclass : #TbElementAlignment,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #'class initialization' }
TbNullAlignment class >> initialize [
	super initialize.
	
	vertical := TbNullVerticalAlignment new.
	horizontal := TbNullHorizontalAlignment new.
]

{ #category : #factory }
TbNullAlignment >> directed: aBlLayoutDirection [
	^ self
]

{ #category : #factory }
TbNullAlignment >> horizontal [
	^ self class horizontal
]

{ #category : #testing }
TbNullAlignment >> ifNotNull: aBlock [
	"nothing"
]

{ #category : #testing }
TbNullAlignment >> ifNull: aBlock [
	aBlock value
]

{ #category : #factory }
TbNullAlignment >> leftToRight [
	^ self
]

{ #category : #factory }
TbNullAlignment >> oriented: aBlLayoutOrientation [
	^ self
]

{ #category : #factory }
TbNullAlignment >> rightToLeft [
	^ self
]

{ #category : #factory }
TbNullAlignment >> vertical [
	^ self class vertical
]
