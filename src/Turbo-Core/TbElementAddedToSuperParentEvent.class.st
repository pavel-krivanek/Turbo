"
Is sent by an element after it or any of its parents is added to another element as a child.

Note: I am not sent when element is re-attached!
"
Class {
	#name : 'TbElementAddedToSuperParentEvent',
	#superclass : 'TbElementEvent',
	#instVars : [
		'addedElement'
	],
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'accessing' }
TbElementAddedToSuperParentEvent >> addedElement [
	<return: #BlElement>

	^ addedElement
]

{ #category : 'accessing' }
TbElementAddedToSuperParentEvent >> addedElement: anElement [
	addedElement := anElement
]

{ #category : 'sending' }
TbElementAddedToSuperParentEvent >> sendTo: anObject [
	anObject elementAddedToSuperParent: self
]
