Class {
	#name : #TbEasingElastic,
	#superclass : #TbEasing,
	#category : #'Turbo-Animation-Interpolators'
}

{ #category : #interpolation }
TbEasingElastic >> interpolate: aProgress [
	^ (2 raisedTo: (10 * (aProgress - 1))) * ((20 * Float pi * 1.5 / 3 * aProgress) cos)
]
