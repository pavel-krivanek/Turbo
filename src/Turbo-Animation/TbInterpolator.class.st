"
I am an abstract Interpolator and define an abstract interpolate: method which is used to calculate interpolated values.

Concrete interpolators or easing function implementations must subclass me and implement #interpolate: method that takes a Number within interval [0.0 - 1.0] and returnes an interpolated value. Note, that returned value is not necessarily positive or lies within the same interval as input value.

- interpolate: returns interpolated value according to implemented interpolation function.

Example

   BlEasingElastic interpolate: 0.5
"
Class {
	#name : #TbInterpolator,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#classInstVars : [
		'default'
	],
	#category : #'Turbo-Animation-Interpolators'
}

{ #category : #cleanup }
TbInterpolator class >> cleanUp [
	super cleanUp.
	
	default := nil
]

{ #category : #'unique instance' }
TbInterpolator class >> default [
	"I return a unique instance of an interpolator with default configuration"
	^ default ifNil: [ default := self new ]
]

{ #category : #interpolation }
TbInterpolator >> interpolate: aNumber [
	^ self subclassResponsibility
]
