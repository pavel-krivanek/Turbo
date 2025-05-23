Class {
	#name : 'TbLinearGradientPaint',
	#superclass : 'TbGradientPaint',
	#instVars : [
		'start',
		'end'
	],
	#category : 'Turbo-Core-Paint',
	#package : 'Turbo-Core',
	#tag : 'Paint'
}

{ #category : 'instance creation' }
TbLinearGradientPaint class >> direction: aPoint [
	"Create a linear gradient in a given direction"
	<return: #BlLinearGradientPaint>
	| aDirection aStart anEnd aDelta |
	
	aDirection := aPoint asPoint.
	aDirection := aDirection isZero
		ifTrue: [ 1@0 ]
		ifFalse: [ aDirection normalized].

	aStart := 0 asPoint.
	anEnd := aStart + aDirection.	
	aDelta := aStart min: anEnd.

	^ self new
		start: aStart - aDelta;
		end: anEnd - aDelta;
		matchExtent: 1.0 asPoint
]

{ #category : 'instance creation' }
TbLinearGradientPaint class >> horizontal [
	"Create a horizontal linear gradient"
	<return: #BlLinearGradientPaint>

	^ self new
		start: 0@0;
		end: 1@0
]

{ #category : 'instance creation' }
TbLinearGradientPaint class >> vertical [
	"Create a vertical linear gradient"
	<return: #BlLinearGradientPaint>

	^ self new
		start: 0@0;
		end: 0@1
]

{ #category : 'accessing' }
TbLinearGradientPaint >> end [
	^ end
]

{ #category : 'accessing' }
TbLinearGradientPaint >> end: aPoint [
	end := aPoint
]

{ #category : 'initialization' }
TbLinearGradientPaint >> initialize [
	super initialize.
	
	
]

{ #category : 'geometry' }
TbLinearGradientPaint >> matchExtent: anExtent [
	| aDirection aStart anEnd aDelta aScaleX aScaleY |
	
	anExtent isZero
		ifTrue: [ ^ self ].
	
	aDirection := (self end - self start) normalized.
	
	aStart := 0@0.
	anEnd := aStart + (anExtent * aDirection).
	
	aScaleX := (anEnd x isZero
		ifTrue: [ 1.0 ]
		ifFalse: [ anExtent x / anEnd x ]) abs.
	aScaleY := (anEnd y isZero
		ifTrue: [ 1.0 ]
		ifFalse: [ anExtent y / anEnd y ]) abs.
	anEnd := anEnd * (aScaleX @ aScaleY).
	
	aDelta := anEnd min: aStart.

	self start: aStart - aDelta.
	self end: anEnd - aDelta
]

{ #category : 'accessing' }
TbLinearGradientPaint >> start [
	^ start
]

{ #category : 'accessing' }
TbLinearGradientPaint >> start: aPoint [
	start := aPoint
]
