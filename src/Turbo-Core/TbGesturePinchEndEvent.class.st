"
Is sent right after the end of a pinch gesture
"
Class {
	#name : 'TbGesturePinchEndEvent',
	#superclass : 'TbGestureBasePinchEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbGesturePinchEndEvent >> sendTo: anObject [
	anObject gesturePinchEndEvent: self
]
