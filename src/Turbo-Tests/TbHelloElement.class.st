Class {
	#name : #TbHelloElement,
	#superclass : #TbElement,
	#category : #'Turbo-Tests'
}

{ #category : #'as yet unclassified' }
TbHelloElement >> drawOnTextBlocCanvas: aCanvas [

	| message | 
	
	message := 'Hello TextBloc'.
	self hasFocus ifTrue: [ message := message asUppercase ].
	
	aCanvas at: 1@1 write: message.

]
