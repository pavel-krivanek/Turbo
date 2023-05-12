Class {
	#name : #TbFlowLayoutTest,
	#superclass : #TbTest,
	#instVars : [
		'e1',
		'e2',
		'e3'
	],
	#category : #'Turbo-Tests'
}

{ #category : #accessing }
TbFlowLayoutTest >> expectedContentTestContentTwoChildrenHorizontal [

	^ '
..................................................
..................................................
..*---------------------**------------------*.....
..|                     ||                  |.....
..|                     || Hello Turbo      |.....
..*---------------------*|                  |.....
.........................|                  |.....
.........................*------------------*.....
..................................................
..................................................
..................................................
..................................................
..................................................
' allButFirst
]

{ #category : #accessing }
TbFlowLayoutTest >> expectedContentTestContentTwoChildrenVertical [

	^ '
..................................................
..................................................
..*---------------------*.........................
..|                     |.........................
..|                     |.........................
..*---------------------*.........................
..*------------------*............................
..|                  |............................
..| Hello Turbo      |............................
..|                  |............................
..|                  |............................
..*------------------*............................
..................................................
' allButFirst
]

{ #category : #accessing }
TbFlowLayoutTest >> extent [ 

	^ 50@13
]

{ #category : #accessing }
TbFlowLayoutTest >> setUp [

	super setUp.
	
	e1 := TbFrameElement new.
	e1 size: 23@4.
	e2 := TbFrameElement new.
	e2 size: 20@6.
	e3 := TbHelloElement new.
	e3 size: 15@2.
	e3 relocate: 2@2.


]

{ #category : #accessing }
TbFlowLayoutTest >> testContentTwoChildrenHorizontal [
	
	space root layout: TbFlowLayout new horizontal.
	space root relocate: 2@2.
	space root addChild: e1.
	space root addChild: e2.
	e2 addChild: e3.

	self firePulse.
	self assert: self content equals: self expectedContentTestContentTwoChildrenHorizontal.

]

{ #category : #accessing }
TbFlowLayoutTest >> testContentTwoChildrenVertical [
	
	space root layout: TbFlowLayout new vertical.
	space root relocate: 2@2.
	space root addChild: e1.
	space root addChild: e2.
	e2 addChild: e3.

	self firePulse.
	self assert: self content equals: self expectedContentTestContentTwoChildrenVertical.

]
