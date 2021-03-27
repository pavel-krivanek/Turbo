Class {
	#name : #BlGestureBaseRotationEvent,
	#superclass : #BlGestureEvent,
	#instVars : [
		'angle'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #accessing }
BlGestureBaseRotationEvent >> angle [
	^ angle
]

{ #category : #accessing }
BlGestureBaseRotationEvent >> angle: anObject [
	angle := anObject
]
