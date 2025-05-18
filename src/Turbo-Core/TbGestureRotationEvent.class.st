Class {
	#name : 'TbGestureRotationEvent',
	#superclass : 'TbGestureBaseRotationEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbGestureRotationEvent >> sendTo: anObject [
	anObject gestureRotationEvent: self
]
