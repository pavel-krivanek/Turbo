Class {
	#name : #TextBlocHelloElement,
	#superclass : #BlElement,
	#category : #'TextBloc-Tests'
}

{ #category : #'as yet unclassified' }
TextBlocHelloElement >> drawOnTextBlocCanvas: aCanvas [

	| message | 
	
	message := 'Hello TextBloc'.
	self hasFocus ifTrue: [ message := message asUppercase ].
	
	aCanvas at: 1@1 write: message.

]
