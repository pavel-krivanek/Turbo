"
I am signalled when user tries to add an ${class:BlElement}$, that is already added to some other element as its child, to some other element.
"
Class {
	#name : #TbAlreadyAddedAsChildError,
	#superclass : #Error,
	#instVars : [
		'element'
	],
	#category : #'Turbo-Core-Basic-Errors'
}

{ #category : #'instance creation' }
TbAlreadyAddedAsChildError class >> element: anElement [
	^ self new element: anElement
]

{ #category : #accessing }
TbAlreadyAddedAsChildError >> description [
	^ 'Can not add child that is already added to another element!'
]

{ #category : #accessing }
TbAlreadyAddedAsChildError >> element [
	<return: #BlElement>

	^ element
]

{ #category : #accessing }
TbAlreadyAddedAsChildError >> element: anElement [
	element := anElement
]
