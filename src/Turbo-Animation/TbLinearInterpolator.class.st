"
I am an interpolator where the rate of change is constant
"
Class {
	#name : #TbLinearInterpolator,
	#superclass : #TbInterpolator,
	#category : #'Turbo-Animation-Interpolators'
}

{ #category : #interpolation }
TbLinearInterpolator >> interpolate: aNumber [
	"f(x) = x"
	<return: #Number>

	^ aNumber
]
