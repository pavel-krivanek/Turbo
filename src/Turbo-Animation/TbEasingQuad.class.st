Class {
	#name : #TbEasingQuad,
	#superclass : #TbEasing,
	#category : #'Turbo-Animation-Interpolators'
}

{ #category : #interpolation }
TbEasingQuad >> interpolate: aProgress [
	^ aProgress raisedTo: 2
]
