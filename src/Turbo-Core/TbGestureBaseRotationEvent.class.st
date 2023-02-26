Class {
	#name : #TbGestureBaseRotationEvent,
	#superclass : #TbGestureEvent,
	#instVars : [
		'angle'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #accessing }
TbGestureBaseRotationEvent >> angle [
	^ angle
]

{ #category : #accessing }
TbGestureBaseRotationEvent >> angle: anObject [
	angle := anObject
]
