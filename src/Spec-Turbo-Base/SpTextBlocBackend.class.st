Class {
	#name : #SpTextBlocBackend,
	#superclass : #SpApplicationBackend,
	#category : #'Spec-Turbo-Base'
}

{ #category : #accessing }
SpTextBlocBackend class >> backendName [

	^ #TextBloc
]

{ #category : #private }
SpTextBlocBackend >> adapterBindingsClass [

	^ SpTextBlocAdapterBindings
]
