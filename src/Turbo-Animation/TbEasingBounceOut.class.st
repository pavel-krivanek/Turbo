Class {
	#name : #TbEasingBounceOut,
	#superclass : #TbEasingBaseBounce,
	#category : #'Turbo-Animation-Interpolators'
}

{ #category : #interpolation }
TbEasingBounceOut >> interpolate: aProgress [
	^ 1-(self computeBounce:(1-aProgress))
]
