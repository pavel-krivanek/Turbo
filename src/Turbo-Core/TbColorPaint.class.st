"
I am a concrete type of BlPaint that is just represented as a Color.

Color paint is transparent then and only then when underlying color's alpha channel is 0
"
Class {
	#name : 'TbColorPaint',
	#superclass : 'TbPaint',
	#instVars : [
		'color'
	],
	#category : 'Turbo-Core-Paint',
	#package : 'Turbo-Core',
	#tag : 'Paint'
}

{ #category : 'instance creation' }
TbColorPaint class >> color: aColor [
	^ self new color: aColor
]

{ #category : 'instance creation' }
TbColorPaint class >> transparent [
	"Return an instance of a paint with transparent color"
	<return: #BlColorPaint>
	
	^ TbTransparentPaint uniqueInstance
]

{ #category : 'comparing' }
TbColorPaint >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	
	^ anotherObject color = self color
]

{ #category : 'accessing' }
TbColorPaint >> color [
	"Return paint's underlying color.
	color can not be nil"
	<return: #Color>
	
	self
		assert: [ color isNotNil ]
		description: [ 'Color can not be nil' ].
	
	^ color
]

{ #category : 'accessing' }
TbColorPaint >> color: aColor [
	"Initialize me with a given Color"
	self
		assert: [ color isNil ]
		description: [ 'Color paint is immutable!' ].

	color := aColor
]

{ #category : 'comparing' }
TbColorPaint >> hash [
	^ self color hash
]

{ #category : 'testing' }
TbColorPaint >> isTransparent [
	"Color paint is transparent when underlying color is transparent
	@see BlPaint>>#isTransparent"
	<return: #Boolean>

	^ color isTransparent
]

{ #category : 'geometry' }
TbColorPaint >> matchExtent: anExtent [
	"do nothing for color paint"
]
