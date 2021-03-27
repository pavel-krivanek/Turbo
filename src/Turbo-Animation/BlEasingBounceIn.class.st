Class {
	#name : #BlEasingBounceIn,
	#superclass : #BlEasingBaseBounce,
	#category : #'Turbo-Animation-Interpolators'
}

{ #category : #interpolation }
BlEasingBounceIn >> interpolate: aProgress [
	^ self computeBounce: aProgress
]
