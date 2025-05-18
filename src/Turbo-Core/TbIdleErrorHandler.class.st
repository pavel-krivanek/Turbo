Class {
	#name : 'TbIdleErrorHandler',
	#superclass : 'TbSingleErrorHandler',
	#category : 'Turbo-Core-Basic-Errors',
	#package : 'Turbo-Core',
	#tag : 'Basic-Errors'
}

{ #category : 'testing' }
TbIdleErrorHandler >> matches: aFramePhase [
	^ aFramePhase isIdlePhase
]

{ #category : 'error handling' }
TbIdleErrorHandler >> processError: aHandledError [
	
]
