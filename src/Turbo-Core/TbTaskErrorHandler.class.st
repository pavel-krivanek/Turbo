Class {
	#name : #TbTaskErrorHandler,
	#superclass : #TbSingleErrorHandler,
	#category : #'Turbo-Core-Basic-Errors'
}

{ #category : #testing }
TbTaskErrorHandler >> matches: aFramePhase [
	^ aFramePhase isTaskPhase
]
