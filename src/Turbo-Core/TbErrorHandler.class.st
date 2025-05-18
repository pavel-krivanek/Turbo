"
I am responsible for error handling that occur in the ${class:BlElement}$


"
Class {
	#name : 'TbErrorHandler',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : 'Turbo-Core-Basic-Errors',
	#package : 'Turbo-Core',
	#tag : 'Basic-Errors'
}

{ #category : 'private' }
TbErrorHandler >> convertToHandledError: anError in: anElement [
	| aHandledError |

	aHandledError := TbHandledError new.
	aHandledError error: anError freeze.
	aHandledError errorHandler: self.
	aHandledError element: anElement.
	aHandledError framePhase: (self framePhaseOf: anElement).

	^ aHandledError
]

{ #category : 'accessing' }
TbErrorHandler >> errors [
	<return: #Collection of: #BlHandledError>

	^ #()
]

{ #category : 'accessing' }
TbErrorHandler >> errorsForPhase: aFramePhase [
	<return: #Collection of: #TbSpaceFramePhase>

	^ self errors select: [ :aHandledError | aHandledError framePhase = aFramePhase ]
]

{ #category : 'private' }
TbErrorHandler >> framePhaseOf: anElement [
	<return: #TbSpaceFramePhase>

	^ anElement isAttachedToSceneGraph
		ifTrue: [ anElement space frame currentPhase ]
		ifFalse: [ TbSpaceFrameUnknownPhase new ]
]

{ #category : 'private' }
TbErrorHandler >> handleCriticalError: aHandledError [
	"Handle an error that no one know how to handle.
	I stop the space and crash the system"
	
	aHandledError error freeze.
	[ aHandledError error debug ] fork
]

{ #category : 'error handling' }
TbErrorHandler >> handleError: anError in: anElement [
	"Handle a given error that comes from a provided visual element"
	| aHandledError |

	aHandledError := self convertToHandledError: anError in: anElement.

	self registerError: aHandledError.
	self processError: aHandledError
]

{ #category : 'testing' }
TbErrorHandler >> hasError [
	<return: #Boolean>
	
	^ self subclassResponsibility
]

{ #category : 'testing' }
TbErrorHandler >> matches: aFramePhase [
	<return: #Boolean>

	^ self subclassResponsibility
]

{ #category : 'error handling' }
TbErrorHandler >> processError: aHandledError [
	self subclassResponsibility
]

{ #category : 'error handling' }
TbErrorHandler >> registerError: aHandledError [
	"Register a given handled error for further debugging"

	self subclassResponsibility
]

{ #category : 'enumerating' }
TbErrorHandler >> with: anElement do: aBlock [
	"Evaluate a given block while handling errors"

	self with: anElement do: aBlock failed: [  ]
]

{ #category : 'enumerating' }
TbErrorHandler >> with: anElement do: aBlock failed: aFailBlock [
	"Evaluate a given block while handling errors"

	self hasError
		ifFalse: [
			aBlock
				on: Error
				do: [ :anError |
					self handleError: anError in: anElement.
					aFailBlock cull: self errors ] ]
		ifTrue: [
			(self errorsForPhase: (self framePhaseOf: anElement))
				ifEmpty: [
					aBlock
						on: Error
						do: [ :anError |
							self handleError: anError in: anElement.
							aFailBlock cull: self errors ] ]
				ifNotEmpty: [ aFailBlock cull: self errors ] ]
]
