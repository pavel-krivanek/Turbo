"
! Background

I represent a background of the ${class:BlElement}$. 
""""I am immutable and can not be changed once created."""" To modify the background, create a new instance and set it by sending ${method:BlElement>>#background:}$

!! Types of background

There are multiple pre-built types of background:
 - paint background ${class:BlPaintBackground}$ which allows users to use any ${class:BlPaint}$ as a background
 - image background ${class:BlImageBackground}$ to use a bitmap ${class:Form}$
 - composite background ${class:BlCompositeBackground}$ letting users to compose different types of background into one more complex background
 - transparent background ${class:BlTransparentBackground}$ as a special type of background that 

Background can be instantiated and composed directly or with the help of ==BlBackgroundBuilder==
See ==BlBackgroundBuilder== for the related example
"
Class {
	#name : #TbBackground,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'opacity'
	],
	#category : #'Turbo-Core-Basic-Background'
}

{ #category : #builder }
TbBackground class >> builder [
	^ TbCompositeBackgroundBuilder new
]

{ #category : #'instance creation' }
TbBackground class >> image: aForm [
	<return: #BlBackground>
	
	^ TbImageBackground image: aForm
]

{ #category : #'instance creation' }
TbBackground class >> paint: aColorOrBlPaint [
	<return: #BlBackground>

	^ TbPaintBackground paint: aColorOrBlPaint
]

{ #category : #'instance creation' }
TbBackground class >> transparent [
	"Return a completely transparent background"
	<return: #BlBackground>
	
	^ TbTransparentBackground uniqueInstance
]

{ #category : #converting }
TbBackground >> asBlBackground [
	^ self
]

{ #category : #initialization }
TbBackground >> defaultOpacity [
	"By default background is completely opaque"
	<return: #Number>

	^ 1.0
]

{ #category : #testing }
TbBackground >> isTransparent [
	"Return true if background is transparent and should not be rendered, false otherwise"
	<return: #Boolean>

	^ self subclassResponsibility
]

{ #category : #geometry }
TbBackground >> matchExtent: anExtent [
	"Resize background to match given extent.
	Used to adapt image or gradient backgrounds to the element's extent"

	self subclassResponsibility
]

{ #category : #accessing }
TbBackground >> opacity [
	<return: #Number>

	^ opacity ifNil: [ self defaultOpacity ]
]

{ #category : #accessing }
TbBackground >> opacity: aNumber [
	self
		assert: [ aNumber isNotNil ]
		description: [ 'Opacity must not be nil' ].
	self
		assert: [ aNumber between: 0.0 and: 1.0 ]
		description: [ 'Opacity value must be within interval [0..1]' ].

	opacity isNotNil
		ifTrue: [ (TbImmutableObjectChangeError object: self) signal ].

	self opacity = aNumber
		ifTrue: [ ^ self ].

	opacity := aNumber
]
