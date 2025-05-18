Class {
	#name : 'TbBackgroundBuilder',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'opacity'
	],
	#category : 'Turbo-Core-Basic-Background',
	#package : 'Turbo-Core',
	#tag : 'Basic-Background'
}

{ #category : 'building' }
TbBackgroundBuilder >> build [
	<return: #BlBackground>

	^ self subclassResponsibility
]

{ #category : 'initialization' }
TbBackgroundBuilder >> initialize [
	super initialize.
	
	opacity := 1.0
]

{ #category : 'building' }
TbBackgroundBuilder >> isOpaque [
	<return: #Boolean>

	^ self opacity closeTo: 1
]

{ #category : 'accessing' }
TbBackgroundBuilder >> opacity [
	<return: #Number>

	^ opacity
]

{ #category : 'accessing' }
TbBackgroundBuilder >> opacity: aNumber [
	self
		assert: [ aNumber isNotNil ]
		description: [ 'Opacity must not be nil' ].
	self
		assert: [ aNumber between: 0.0 and: 1.0 ]
		description: [ 'Opacity value must be within interval [0..1]' ].

	opacity := aNumber
]
