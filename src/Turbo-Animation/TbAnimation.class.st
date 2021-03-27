Class {
	#name : #TbAnimation,
	#superclass : #TbBaseAnimation,
	#instVars : [
		'duration',
		'easing'
	],
	#category : #'Turbo-Animation-Basic'
}

{ #category : #pulse }
TbAnimation >> applyValue: aValue [
	
]

{ #category : #'delta computing' }
TbAnimation >> computeDelta: aProgress [
	^ easing interpolate: aProgress
]

{ #category : #pulse }
TbAnimation >> doStep [
	self applyValue: (self valueForStep: (self computeDelta: progress))
]

{ #category : #accessing }
TbAnimation >> duration [
	"Return animation duration. Duration can not necessarily be set manually, in case
	of composite animations it is computed on-fly based on durations of their sub-animations"
	<return: #Duration>

	^ duration
]

{ #category : #'api - configuration' }
TbAnimation >> duration: aDuration [
	self
		assert: [ aDuration > 0 seconds ]
		description: [ 'Duration must be positive' ].

	duration := aDuration asDuration
]

{ #category : #accessing }
TbAnimation >> easing [
	^ easing
]

{ #category : #accessing }
TbAnimation >> easing: anObject [
	easing := anObject
]

{ #category : #initialization }
TbAnimation >> initialize [
	super initialize.
	
	duration := 1 second.	"configurable"
	easing := TbEasing linear
]

{ #category : #pulse }
TbAnimation >> valueForStep: aDelta [
	
]
