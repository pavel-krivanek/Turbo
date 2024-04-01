Class {
	#name : #TbImagePatternPaint,
	#superclass : #TbPaint,
	#instVars : [
		'form'
	],
	#category : #'Turbo-Core-Paint'
}

{ #category : #'as yet unclassified' }
TbImagePatternPaint class >> form: aForm [
	^ self new form: aForm
]

{ #category : #accessing }
TbImagePatternPaint >> form [
	^ form
]

{ #category : #accessing }
TbImagePatternPaint >> form: aForm [
	form := aForm
]

{ #category : #geometry }
TbImagePatternPaint >> matchExtent: anExtent [
	"don't know what to do for the image pattern paint"
]
