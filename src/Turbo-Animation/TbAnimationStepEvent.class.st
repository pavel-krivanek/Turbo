"
I am sent after every animation step with current progress as a parameter
"
Class {
	#name : #TbAnimationStepEvent,
	#superclass : #TbEvent,
	#instVars : [
		'progress'
	],
	#category : #'Turbo-Animation-Events'
}

{ #category : #accessing }
TbAnimationStepEvent >> progress [
	<return: #Number>

	^ progress
]

{ #category : #accessing }
TbAnimationStepEvent >> progress: aNumber [
	self
		assert: [ aNumber between: 0 and: 1 ]
		description: [ 'Progress must be within interval [0...1]' ].

	progress := aNumber
]
