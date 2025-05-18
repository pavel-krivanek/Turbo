Class {
	#name : 'TbTaskErrorHandler',
	#superclass : 'TbSingleErrorHandler',
	#category : 'Turbo-Core-Basic-Errors',
	#package : 'Turbo-Core',
	#tag : 'Basic-Errors'
}

{ #category : 'testing' }
TbTaskErrorHandler >> matches: aFramePhase [
	^ aFramePhase isTaskPhase
]
