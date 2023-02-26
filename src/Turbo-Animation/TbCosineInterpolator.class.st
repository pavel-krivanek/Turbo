"
I am a cosinus interpolator defined by the following function:

	f(x) = cos(x)
"
Class {
	#name : #TbCosineInterpolator,
	#superclass : #TbInterpolator,
	#instVars : [
		'range'
	],
	#category : #'Turbo-Animation-Interpolators'
}

{ #category : #initialization }
TbCosineInterpolator >> initialize [
	super initialize.
	
	range := 2 * Float pi
]

{ #category : #interpolation }
TbCosineInterpolator >> interpolate: aNumber [
	"f(x) = cos(x)"
	<return: #Number>

	^ (aNumber * self range) cos
]

{ #category : #accessing }
TbCosineInterpolator >> range [
	<return: #Number>

	^ range
]

{ #category : #accessing }
TbCosineInterpolator >> range: aNumberInRadians [
	range := aNumberInRadians
]
