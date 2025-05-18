"
I provide composition ability of multiple ===BlBackground===.
I am useful when an Element should have both paint and image backgrounds.

Note: composed backgrounds are rendered in the same order they are defined in a composition. So for example if I was created as follows:

BlCompositeBackground withAll: {
	BlPaintBackground paint: Color red.
	BlImageBackground image: PolymorphSystemSettings pharoLogoForm
} 

then image background will appear on top of paint background.

It is more convenient to create a composite background using ===BlBackgroundBuilder===

Opacity example:

	BlCompositeBackground new
		opacity: 0.5;
		withAll: {
			BlPaintBackground paint: Color red.
			BlImageBackground image: PolymorphSystemSettings pharoLogoForm
		} 
"
Class {
	#name : 'TbCompositeBackground',
	#superclass : 'TbBackground',
	#instVars : [
		'backgrounds'
	],
	#category : 'Turbo-Core-Basic-Background',
	#package : 'Turbo-Core',
	#tag : 'Basic-Background'
}

{ #category : 'instance creation' }
TbCompositeBackground class >> withAll: aCollectionOfBackground [
	^ self new withAll: aCollectionOfBackground
]

{ #category : 'accessing' }
TbCompositeBackground >> backgrounds [
	<return: #Collection of: #BlBackground>

	^ backgrounds
]

{ #category : 'initialization' }
TbCompositeBackground >> initialize [
	super initialize.
	
	backgrounds := Array new
]

{ #category : 'testing' }
TbCompositeBackground >> isTransparent [
	<return: #Boolean>

	^ (self opacity closeTo: 0.0) or: [ backgrounds allSatisfy: #isTransparent ]
]

{ #category : 'geometry' }
TbCompositeBackground >> matchExtent: anExtent [
	backgrounds do: [ :aBackground | aBackground matchExtent: anExtent ]
]

{ #category : 'initialization' }
TbCompositeBackground >> withAll: aCollectionOfBackgrounds [
	self
		assert: [ aCollectionOfBackgrounds isNotNil ]
		description: [ 'Collection must not be nil' ].
	self
		assert: [ aCollectionOfBackgrounds allSatisfy: #isNotNil ]
		description: [ 'All backgrounds must not be nil' ].
	self
		assert: [ aCollectionOfBackgrounds isNotEmpty ]
		description: [ 'Collection of background must not be empty' ].

	backgrounds := aCollectionOfBackgrounds asArray copy
]
