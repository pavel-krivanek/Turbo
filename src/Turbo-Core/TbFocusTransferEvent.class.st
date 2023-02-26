Class {
	#name : #TbFocusTransferEvent,
	#superclass : #TbBaseFocusEvent,
	#instVars : [
		'transfer'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #testing }
TbFocusTransferEvent >> hasTransfer [
	^ transfer isNotNil
]

{ #category : #testing }
TbFocusTransferEvent >> isFocusTransfer [
	^ true
]

{ #category : #sending }
TbFocusTransferEvent >> sendTo: anObject [
	anObject focusTransferEvent: self
]

{ #category : #accessing }
TbFocusTransferEvent >> transfer [
	self
		assert: [ self hasTransfer ]
		description: [ 'Can not access transfer element when it does not exist' ].

	^ transfer
]

{ #category : #accessing }
TbFocusTransferEvent >> transfer: anObject [
	transfer := anObject
]
