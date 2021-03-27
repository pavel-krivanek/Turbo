Class {
	#name : #TbEasing,
	#superclass : #TbInterpolator,
	#category : #'Turbo-Animation-Interpolators'
}

{ #category : #factory }
TbEasing class >> bounceIn [
	^ TbEasingBounceIn default
]

{ #category : #factory }
TbEasing class >> bounceInOut [
	^ TbEasingBounceInOut default
]

{ #category : #factory }
TbEasing class >> bounceOut [
	^ TbEasingBounceOut default
]

{ #category : #factory }
TbEasing class >> linear [
	^ TbLinearInterpolator default
]

{ #category : #interpolation }
TbEasing >> deltaByProgress: aProgress [
	^ self interpolate: aProgress
]
