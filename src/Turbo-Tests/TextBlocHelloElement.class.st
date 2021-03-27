Class {
	#name : #TextBlocHelloElement,
	#superclass : #BlElement,
	#category : #'Turbo-Tests'
}

{ #category : #'as yet unclassified' }
TextBlocHelloElement >> drawOnTextBlocCanvas: aCanvas [

	| message | 
	
	message := 'Hello TextBloc'.
	self hasFocus ifTrue: [ message := message asUppercase ].
	
	aCanvas at: 1@1 write: message.

]
