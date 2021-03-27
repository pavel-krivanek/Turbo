Class {
	#name : #TbViscousFluidInterpolator,
	#superclass : #TbInterpolator,
	#classVars : [
		'FluidNormalize',
		'FluidOffset',
		'FluidScale',
		'InvertedExponent'
	],
	#category : #'Turbo-Animation-Interpolators'
}

{ #category : #initialization }
TbViscousFluidInterpolator class >> initialize [
	super initialize.
	
	InvertedExponent := 1.0 / Float e.
	"Controls the viscous fluid effect (how much of it)"
	FluidScale := 8.0.
	"must be set to 1.0 (used in viscousFluid())"
	FluidNormalize := 1.0 / (self viscousFluid: 1.0).
	"account for very small floating-point error"
	FluidOffset := 1.0 - (FluidNormalize * (self viscousFluid: 1.0))
]

{ #category : #interpolation }
TbViscousFluidInterpolator class >> viscousFluid: aNumber [
	| value |
	value := aNumber * FluidScale.
	value < 1.0
		ifTrue: [ value := value - (1.0 - value negated exp) ]
		ifFalse: [ 
			value := 1.0 - (1.0 - value) exp.
			value := InvertedExponent + (value * ( 1.0 - InvertedExponent)) ].
	^ value
]

{ #category : #interpolation }
TbViscousFluidInterpolator >> interpolate: aNumber [
	| interpolated |
	
	interpolated := FluidNormalize * (self class viscousFluid: aNumber).
	^ interpolated > 0
		ifTrue: [ interpolated + FluidOffset ]
		ifFalse: [ interpolated ]
]
