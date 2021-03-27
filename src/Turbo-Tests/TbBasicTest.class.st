Class {
	#name : #TbBasicTest,
	#superclass : #TbTest,
	#instVars : [
		'element'
	],
	#category : #'Turbo-Tests'
}

{ #category : #running }
TbBasicTest >> setUp [

	super setUp.
	element := TbHelloElement new.
	space root addChild: element.
	
	self firePulse.


]

{ #category : #running }
TbBasicTest >> testContent [

	self firePulse.
	self assert: (self content beginsWith: 'Hello TextBloc')
]
