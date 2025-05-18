Class {
	#name : 'TbLayoutErrorHandler',
	#superclass : 'TbSingleErrorHandler',
	#category : 'Turbo-Core-Basic-Errors',
	#package : 'Turbo-Core',
	#tag : 'Basic-Errors'
}

{ #category : 'testing' }
TbLayoutErrorHandler >> matches: aFramePhase [
	^ aFramePhase isLayoutPhase
]

{ #category : 'error handling' }
TbLayoutErrorHandler >> processError: anError [
	anError inspect
]
