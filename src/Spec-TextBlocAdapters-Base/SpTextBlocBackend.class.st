Class {
	#name : #SpTextBlocBackend,
	#superclass : #SpApplicationBackend,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #accessing }
SpTextBlocBackend class >> backendName [

	^ #TextBloc
]

{ #category : #private }
SpTextBlocBackend >> adapterBindingsClass [

	^ SpTextBlocAdapterBindings
]
