Class {
	#name : #TextBlocBasicTest,
	#superclass : #TextBlocTest,
	#instVars : [
		'element'
	],
	#category : #'TextBloc-Tests'
}

{ #category : #running }
TextBlocBasicTest >> setUp [

	super setUp.
	element := TextBlocHelloElement new.
	space root addChild: element.
	
	self firePulse.


]

{ #category : #running }
TextBlocBasicTest >> testContent [

	self firePulse.
	self assert: (self content beginsWith: 'Hello TextBloc')
]
