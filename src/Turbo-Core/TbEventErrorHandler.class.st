Class {
	#name : #TbEventErrorHandler,
	#superclass : #TbSingleErrorHandler,
	#category : #'Turbo-Core-Basic-Errors'
}

{ #category : #testing }
TbEventErrorHandler >> matches: aFramePhase [
	^ aFramePhase isEventPhase
]
