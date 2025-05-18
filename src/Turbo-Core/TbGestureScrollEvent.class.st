Class {
	#name : 'TbGestureScrollEvent',
	#superclass : 'TbGestureBaseScrollEvent',
	#instVars : [
		'vector'
	],
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbGestureScrollEvent >> sendTo: anObject [
	anObject gestureScrollEvent: self
]

{ #category : 'accessing' }
TbGestureScrollEvent >> vector [
	<return: #TbVector>

	^ vector
]

{ #category : 'accessing' }
TbGestureScrollEvent >> vector: aBlVector [
	vector := aBlVector
]
