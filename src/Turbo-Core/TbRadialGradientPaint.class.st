Class {
	#name : 'TbRadialGradientPaint',
	#superclass : 'TbGradientPaint',
	#instVars : [
		'center',
		'radius',
		'focalPoint'
	],
	#category : 'Turbo-Core-Paint',
	#package : 'Turbo-Core',
	#tag : 'Paint'
}

{ #category : 'accessing' }
TbRadialGradientPaint >> center [
	^ center
]

{ #category : 'accessing' }
TbRadialGradientPaint >> center: anObject [
	center := anObject
]

{ #category : 'accessing' }
TbRadialGradientPaint >> focalPoint [
	^focalPoint ifNil:[focalPoint := center]
]

{ #category : 'accessing' }
TbRadialGradientPaint >> focalPoint: aPoint [
	focalPoint := aPoint
]

{ #category : 'geometry' }
TbRadialGradientPaint >> matchExtent: anExtent [
	
	self center: anExtent * (self center / 100.0) asFloatPoint.
	self focalPoint: anExtent * (self focalPoint / 100.0) asFloatPoint.
	self radius: (anExtent distanceTo: 0@0) * (self radius / 100.0) asFloat
]

{ #category : 'accessing' }
TbRadialGradientPaint >> radius [
	^ radius
]

{ #category : 'accessing' }
TbRadialGradientPaint >> radius: anObject [
	radius := anObject
]
