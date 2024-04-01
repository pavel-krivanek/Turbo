Class {
	#name : #TbImmutableObjectChangeError,
	#superclass : #Error,
	#instVars : [
		'object'
	],
	#category : #'Turbo-Core-Basic-Errors'
}

{ #category : #accessing }
TbImmutableObjectChangeError class >> object: anObject [
	^ self new object: anObject
]

{ #category : #accessing }
TbImmutableObjectChangeError >> description [
	^ self object printString, ' is immutable and can not be changed'
]

{ #category : #accessing }
TbImmutableObjectChangeError >> object [
	^ object
]

{ #category : #accessing }
TbImmutableObjectChangeError >> object: anObject [
	object := anObject
]
