"
Is sent periodically during the pinch gesture.
"
Class {
	#name : #TbGesturePinchEvent,
	#superclass : #TbGestureBasePinchEvent,
	#instVars : [
		'distance'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #accessing }
TbGesturePinchEvent >> distance [
	<return: #Number>

	^ distance
]

{ #category : #accessing }
TbGesturePinchEvent >> distance: aNumber [
	distance := aNumber
]

{ #category : #sending }
TbGesturePinchEvent >> sendTo: anObject [
	anObject gesturePinchEvent: self
]
