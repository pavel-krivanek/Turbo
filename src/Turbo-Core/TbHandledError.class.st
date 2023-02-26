"
I represent an error that bloc gracefully handled during some specific frame phase
"
Class {
	#name : #TbHandledError,
	#superclass : #Object,
	#instVars : [
		'error',
		'errorHandler',
		'framePhase',
		'element'
	],
	#category : #'Turbo-Core-Basic-Errors'
}

{ #category : #accessing }
TbHandledError >> element [
	<return: #BlElement>

	^ element
]

{ #category : #accessing }
TbHandledError >> element: anElement [
	element := anElement
]

{ #category : #accessing }
TbHandledError >> error [
	^ error
]

{ #category : #accessing }
TbHandledError >> error: anError [
	error := anError
]

{ #category : #accessing }
TbHandledError >> errorHandler [
	^ errorHandler
]

{ #category : #accessing }
TbHandledError >> errorHandler: anObject [
	errorHandler := anObject
]

{ #category : #accessing }
TbHandledError >> framePhase [
	<return: #SpaceFramePhase>

	^ framePhase
]

{ #category : #accessing }
TbHandledError >> framePhase: aSpaceFramePhase [
	framePhase := aSpaceFramePhase
]
