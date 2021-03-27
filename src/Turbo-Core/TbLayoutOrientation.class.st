"
I represent a abstract layout orientation.

I am used by layouts that support different orientations and by element alignment.
I do not have any logic and can only used as orientation flag. Layouts that have orientation specific logic should impelment their own object oriented mechanism
"
Class {
	#name : #TbLayoutOrientation,
	#superclass : #Object,
	#classVars : [
		'horizontal',
		'vertical'
	],
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #factory }
TbLayoutOrientation class >> horizontal [
	^ horizontal
]

{ #category : #'class initialization' }
TbLayoutOrientation class >> initialize [
	super initialize.
	
	horizontal := BlLayoutHorizontal new.
	vertical := BlLayoutVertical new
]

{ #category : #factory }
TbLayoutOrientation class >> vertical [
	^ vertical
]

{ #category : #testing }
TbLayoutOrientation >> isHorizontal [
	^ self subclassResponsibility
]

{ #category : #testing }
TbLayoutOrientation >> isVertical [
	^ self subclassResponsibility
]

{ #category : #dispatch }
TbLayoutOrientation >> of: anObject [
	^ self subclassResponsibility
]
