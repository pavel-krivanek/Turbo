Class {
	#name : 'TbGestureRotationBeginEvent',
	#superclass : 'TbGestureBaseRotationEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbGestureRotationBeginEvent >> sendTo: anObject [
	anObject gestureRotationBeginEvent: self
]
