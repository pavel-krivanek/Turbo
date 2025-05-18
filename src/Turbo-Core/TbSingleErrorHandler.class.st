Class {
	#name : 'TbSingleErrorHandler',
	#superclass : 'TbErrorHandler',
	#instVars : [
		'error'
	],
	#category : 'Turbo-Core-Basic-Errors',
	#package : 'Turbo-Core',
	#tag : 'Basic-Errors'
}

{ #category : 'comparing' }
TbSingleErrorHandler >> = anObject [
	^ self class = anObject class
]

{ #category : 'accessing' }
TbSingleErrorHandler >> error [
	<return: #BlHandledError>

	^ error
]

{ #category : 'accessing' }
TbSingleErrorHandler >> error: aHandledError [
	
	self
		assert: [ aHandledError isNotNil ]
		description: [ 'Error must not be nil' ].

	error := aHandledError
]

{ #category : 'accessing' }
TbSingleErrorHandler >> errors [
	^ { self error }
]

{ #category : 'testing' }
TbSingleErrorHandler >> hasError [
	<return: #Boolean>

	^ error isNotNil
]

{ #category : 'comparing' }
TbSingleErrorHandler >> hash [
	^ self class hash
]

{ #category : 'error handling' }
TbSingleErrorHandler >> registerError: aHandledError [
	"Register a given handled error for further debugging"

	self error: aHandledError
]
