Class {
	#name : 'TbGestureRotationEndEvent',
	#superclass : 'TbGestureBaseRotationEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbGestureRotationEndEvent >> sendTo: anObject [
	anObject gestureRotationEndEvent: self
]
