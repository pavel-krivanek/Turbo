"
I am a cosinus interpolator defined by the following function:

	f(x) = sin(x)
"
Class {
	#name : #TbSineInterpolator,
	#superclass : #TbInterpolator,
	#instVars : [
		'range'
	],
	#category : #'Turbo-Animation-Interpolators'
}

{ #category : #initialization }
TbSineInterpolator >> initialize [
	super initialize.
	
	range := 2 * Float pi
]

{ #category : #interpolation }
TbSineInterpolator >> interpolate: aNumber [
	"f(x) = sin(x)"
	<return: #Number>

	^ (aNumber * self range) sin
]

{ #category : #accessing }
TbSineInterpolator >> range [
	<return: #Number>

	^ range
]

{ #category : #accessing }
TbSineInterpolator >> range: aNumberInRadians [
	range := aNumberInRadians
]
