Class {
	#name : #SpTextBlocAdapterBindings,
	#superclass : #SpAdapterBindings,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #queries }
SpTextBlocAdapterBindings >> abstractAdapterClass [
	^ SpTextBlocAbstractAdapter
]

{ #category : #queries }
SpTextBlocAdapterBindings >> defaultFont [

	^ StubFixedFont new
]
