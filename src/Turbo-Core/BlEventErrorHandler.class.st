Class {
	#name : #BlEventErrorHandler,
	#superclass : #BlSingleErrorHandler,
	#category : #'Turbo-Core-Basic-Errors'
}

{ #category : #testing }
BlEventErrorHandler >> matches: aFramePhase [
	^ aFramePhase isEventPhase
]
