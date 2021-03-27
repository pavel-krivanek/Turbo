Class {
	#name : #TbEasing,
	#superclass : #TbInterpolator,
	#category : #'Turbo-Animation-Interpolators'
}

{ #category : #factory }
TbEasing class >> bounceIn [
	^ BlEasingBounceIn default
]

{ #category : #factory }
TbEasing class >> bounceInOut [
	^ BlEasingBounceInOut default
]

{ #category : #factory }
TbEasing class >> bounceOut [
	^ BlEasingBounceOut default
]

{ #category : #factory }
TbEasing class >> linear [
	^ BlLinearInterpolator default
]

{ #category : #interpolation }
TbEasing >> deltaByProgress: aProgress [
	^ self interpolate: aProgress
]
