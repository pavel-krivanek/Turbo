"
Is sent right before the begin of a pinch gesture
"
Class {
	#name : #TbGesturePinchBeginEvent,
	#superclass : #TbGestureBasePinchEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbGesturePinchBeginEvent >> sendTo: anObject [
	anObject gesturePinchBeginEvent: self
]
