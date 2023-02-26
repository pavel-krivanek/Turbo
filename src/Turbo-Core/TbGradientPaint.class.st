Class {
	#name : #TbGradientPaint,
	#superclass : #TbPaint,
	#instVars : [
		'stops'
	],
	#category : #'Turbo-Core-Paint'
}

{ #category : #initialization }
TbGradientPaint >> from: aStartColor to: anEndColor [
	"A convenience method to create a gradient consisting out of 2 colors"
	
	self stops: { 
		0 -> aStartColor.
		1 -> anEndColor
	}
]

{ #category : #accessing }
TbGradientPaint >> stops [
	^ stops
]

{ #category : #accessing }
TbGradientPaint >> stops: anArray [
	stops := anArray
]
