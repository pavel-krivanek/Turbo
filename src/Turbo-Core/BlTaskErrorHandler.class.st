Class {
	#name : #BlTaskErrorHandler,
	#superclass : #BlSingleErrorHandler,
	#category : #'Turbo-Core-Basic-Errors'
}

{ #category : #testing }
BlTaskErrorHandler >> matches: aFramePhase [
	^ aFramePhase isTaskPhase
]
