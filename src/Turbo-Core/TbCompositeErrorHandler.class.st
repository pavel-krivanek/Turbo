Class {
	#name : #TbCompositeErrorHandler,
	#superclass : #TbErrorHandler,
	#instVars : [
		'errors',
		'errorHandlers'
	],
	#category : #'Turbo-Core-Basic-Errors'
}

{ #category : #'instance creation' }
TbCompositeErrorHandler class >> withAll: aCollectionOfErrorHandlers [
	^ self new addErrorHandlers: aCollectionOfErrorHandlers
]

{ #category : #adding }
TbCompositeErrorHandler >> addErrorHandler: anErrorHandler [
	self errorHandlers add: anErrorHandler
]

{ #category : #adding }
TbCompositeErrorHandler >> addErrorHandlers: aCollectionOfErrorHandlers [
	self errorHandlers addAll: aCollectionOfErrorHandlers
]

{ #category : #accessing }
TbCompositeErrorHandler >> errorHandlers [
	<return: #Collection of: #BlErrorHandler>

	^ errorHandlers
]

{ #category : #accessing }
TbCompositeErrorHandler >> errors [
	^ errors
]

{ #category : #testing }
TbCompositeErrorHandler >> hasError [
	<return: #Boolean>

	^ self errors isNotEmpty
]

{ #category : #initialization }
TbCompositeErrorHandler >> initialize [
	super initialize.

	errorHandlers := Set new.
	errors := OrderedCollection new
]

{ #category : #testing }
TbCompositeErrorHandler >> matches: aFramePhase [
	^ self errorHandlers anySatisfy: [ :anErrorHandler | anErrorHandler matches: aFramePhase ]
]

{ #category : #'error handling' }
TbCompositeErrorHandler >> processError: aHandledError [
	self errorHandlers
		detect: [ :anErrorHandler | anErrorHandler matches: aHandledError framePhase ]
		ifFound: [ :anErrorHandler | anErrorHandler handleError: aHandledError error in: aHandledError element ]
		ifNone: [ self handleCriticalError: aHandledError ]
]

{ #category : #'error handling' }
TbCompositeErrorHandler >> registerError: aHandledError [
	self errors add: aHandledError
]
