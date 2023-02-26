Class {
	#name : #TbHelloElement,
	#superclass : #TbElement,
	#category : #'Turbo-Tests'
}

{ #category : #'as yet unclassified' }
TbHelloElement >> drawOnTurboCanvas: aCanvas [

	| message | 
	
	message := 'Hello Turbo'.
	self hasFocus ifTrue: [ message := message asUppercase ].
	
	aCanvas at: 1@1 write: message.

]
