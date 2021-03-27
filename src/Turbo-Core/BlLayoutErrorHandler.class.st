Class {
	#name : #BlLayoutErrorHandler,
	#superclass : #BlSingleErrorHandler,
	#category : #'Turbo-Core-Basic-Errors'
}

{ #category : #testing }
BlLayoutErrorHandler >> matches: aFramePhase [
	^ aFramePhase isLayoutPhase
]

{ #category : #'error handling' }
BlLayoutErrorHandler >> processError: anError [
	anError inspect
]
