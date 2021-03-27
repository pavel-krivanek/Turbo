Class {
	#name : #BlIdleErrorHandler,
	#superclass : #BlSingleErrorHandler,
	#category : #'Turbo-Core-Basic-Errors'
}

{ #category : #testing }
BlIdleErrorHandler >> matches: aFramePhase [
	^ aFramePhase isIdlePhase
]

{ #category : #'error handling' }
BlIdleErrorHandler >> processError: aHandledError [
	
]
