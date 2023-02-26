"
Is sent right after the end of a pinch gesture
"
Class {
	#name : #TbGesturePinchEndEvent,
	#superclass : #TbGestureBasePinchEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbGesturePinchEndEvent >> sendTo: anObject [
	anObject gesturePinchEndEvent: self
]
