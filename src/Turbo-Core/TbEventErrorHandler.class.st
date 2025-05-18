Class {
	#name : 'TbEventErrorHandler',
	#superclass : 'TbSingleErrorHandler',
	#category : 'Turbo-Core-Basic-Errors',
	#package : 'Turbo-Core',
	#tag : 'Basic-Errors'
}

{ #category : 'testing' }
TbEventErrorHandler >> matches: aFramePhase [
	^ aFramePhase isEventPhase
]
