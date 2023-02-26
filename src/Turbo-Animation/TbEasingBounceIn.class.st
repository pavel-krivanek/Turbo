Class {
	#name : #TbEasingBounceIn,
	#superclass : #TbEasingBaseBounce,
	#category : #'Turbo-Animation-Interpolators'
}

{ #category : #interpolation }
TbEasingBounceIn >> interpolate: aProgress [
	^ self computeBounce: aProgress
]
