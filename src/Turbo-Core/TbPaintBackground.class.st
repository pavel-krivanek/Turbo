"
I am a background that uses a ===BlPaint===. A paint can be either a simple color or a type of gradient.

!! Examples
Examples are provided by the class ${class:BlPaintBackgroundExamples}$.

"
Class {
	#name : #TbPaintBackground,
	#superclass : #TbBackground,
	#instVars : [
		'paint'
	],
	#category : #'Turbo-Core-Basic-Background'
}

{ #category : #'instance creation' }
TbPaintBackground class >> paint: aBlPaint [
	^ self new paint: aBlPaint
]

{ #category : #comparing }
TbPaintBackground >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	
	^ anotherObject paint = self paint
]

{ #category : #comparing }
TbPaintBackground >> hash [
	^ self paint hash bitXor: self class hash
]

{ #category : #testing }
TbPaintBackground >> isTransparent [
	"Paint background is transparent then and only then when paint is transparent or opacity is close to 0"
	<return: #Boolean>

	^ (self opacity closeTo: 0) or: [ self paint isTransparent ]
]

{ #category : #geometry }
TbPaintBackground >> matchExtent: anExtent [
	self paint matchExtent: anExtent
]

{ #category : #accessing }
TbPaintBackground >> paint [
	<return: #BlPaint>

	^ paint
]

{ #category : #accessing }
TbPaintBackground >> paint: aBlPaint [
	self
		assert: [ aBlPaint isNotNil ]
		description: [ 'Paint must not be nil' ].

	paint isNotNil
		ifTrue: [ (TbImmutableObjectChangeError object: self) signal ].

	paint := aBlPaint asBlPaint
]
