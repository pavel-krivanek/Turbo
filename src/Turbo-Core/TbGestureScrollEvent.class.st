Class {
	#name : #TbGestureScrollEvent,
	#superclass : #TbGestureBaseScrollEvent,
	#instVars : [
		'vector'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbGestureScrollEvent >> sendTo: anObject [
	anObject gestureScrollEvent: self
]

{ #category : #accessing }
TbGestureScrollEvent >> vector [
	<return: #BlVector>

	^ vector
]

{ #category : #accessing }
TbGestureScrollEvent >> vector: aBlVector [
	vector := aBlVector
]
