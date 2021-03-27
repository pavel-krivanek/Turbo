"
Is sent every frame if there are pressed keys.
Users can get access to pressed keys from provided event buffer 
"
Class {
	#name : #TbKeysPressedEvent,
	#superclass : #TbKeyboardEvent,
	#instVars : [
		'buffer'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #accessing }
TbKeysPressedEvent >> buffer [
	^ buffer
]

{ #category : #accessing }
TbKeysPressedEvent >> buffer: aBlKeyboardBuffer [
	buffer := aBlKeyboardBuffer
]

{ #category : #sending }
TbKeysPressedEvent >> sendTo: anObject [
	anObject keysPressedEvent: self
]
