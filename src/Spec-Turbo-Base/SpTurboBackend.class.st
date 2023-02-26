Class {
	#name : #SpTurboBackend,
	#superclass : #SpApplicationBackend,
	#category : #'Spec-Turbo-Base'
}

{ #category : #accessing }
SpTurboBackend class >> backendName [

	^ #Turbo
]

{ #category : #private }
SpTurboBackend >> adapterBindingsClass [

	^ SpTurboAdapterBindings
]

{ #category : #private }
SpTurboBackend >> defaultConfigurationFor: anApplication [

	^ SpMockConfiguration new
]
