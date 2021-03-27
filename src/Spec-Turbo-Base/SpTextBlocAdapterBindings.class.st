Class {
	#name : #SpTextBlocAdapterBindings,
	#superclass : #SpAdapterBindings,
	#category : #'Spec-Turbo-Base'
}

{ #category : #queries }
SpTextBlocAdapterBindings >> abstractAdapterClass [
	^ SpTextBlocAbstractAdapter
]

{ #category : #queries }
SpTextBlocAdapterBindings >> defaultFont [

	^ StubFixedFont new
]
