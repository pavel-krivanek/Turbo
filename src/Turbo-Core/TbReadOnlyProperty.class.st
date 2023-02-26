"
I am the abstract class for read-only observable property.
This means that i have to be subclassed to provide an auto-update mechanism.
"
Class {
	#name : #TbReadOnlyProperty,
	#superclass : #TbObservableProperty,
	#category : #'Turbo-Core-Property'
}

{ #category : #'initialize-release' }
TbReadOnlyProperty >> initialize [
	super initialize.
	isValid := true
]
