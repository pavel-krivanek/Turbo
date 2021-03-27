Class {
	#name : #TextBlocBasicLayoutTest,
	#superclass : #TextBlocTest,
	#instVars : [
		'e1',
		'e2',
		'e3'
	],
	#category : #'TextBloc-Tests'
}

{ #category : #accessing }
TextBlocBasicLayoutTest >> expectedContent [

	^ '..................................................
..................................................
..*---------------------**------------------*.....
..|                     ||                  |.....
..|                     || Hello TextBloc   |.....
..*---------------------*|                  |.....
.........................|                  |.....
.........................*------------------*.....
..................................................
..................................................
'
]

{ #category : #accessing }
TextBlocBasicLayoutTest >> setUp [

	super setUp.
	
	e1 := TextBlocFrameElement new.
	e1 size: 23@4.
	e2 := TextBlocFrameElement new.
	e2 size: 20@6.
	e3 := TextBlocHelloElement new.
	e3 size: 15@2.
	e3 relocate: 2@2.

	space root layout: BlFlowLayout new horizontal.
	space root relocate: 2@2.
	space root addChild: e1.
	space root addChild: e2.
	e2 addChild: e3.



]

{ #category : #accessing }
TextBlocBasicLayoutTest >> testContent [

	self firePulse.
	self assert: self content equals: self expectedContent
]
