Class {
	#name : #SpTurboAdapterBindings,
	#superclass : #SpAdapterBindings,
	#category : #'Spec-Turbo-Base'
}

{ #category : #queries }
SpTurboAdapterBindings >> abstractAdapterClass [
	^ SpTurboAbstractAdapter
]

{ #category : #queries }
SpTurboAdapterBindings >> defaultFont [

	^ StubFixedFont new
]
