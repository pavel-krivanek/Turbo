Class {
	#name : 'TbGestureBaseRotationEvent',
	#superclass : 'TbGestureEvent',
	#instVars : [
		'angle'
	],
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'accessing' }
TbGestureBaseRotationEvent >> angle [
	^ angle
]

{ #category : 'accessing' }
TbGestureBaseRotationEvent >> angle: anObject [
	angle := anObject
]
