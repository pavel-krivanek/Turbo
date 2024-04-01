Class {
	#name : #SpTurboTerminalBackend,
	#superclass : #SpTurboBackend,
	#category : #'Spec-Turbo-Base'
}

{ #category : #accessing }
SpTurboTerminalBackend class >> backendName [

	^ #TurboTerminal
]

{ #category : #private }
SpTurboTerminalBackend >> newHost [ 

	^ TbTerminalHost new
]
