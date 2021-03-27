Class {
	#name : #BlEasingQuad,
	#superclass : #BlEasing,
	#category : #'Turbo-Animation-Interpolators'
}

{ #category : #interpolation }
BlEasingQuad >> interpolate: aProgress [
	^ aProgress raisedTo: 2
]
