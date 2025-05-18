Class {
	#name : 'TbGridLayoutTest',
	#superclass : 'TbTest',
	#instVars : [
		'e1',
		'e2',
		'e3'
	],
	#category : 'Turbo-Tests',
	#package : 'Turbo-Tests'
}

{ #category : 'accessing' }
TbGridLayoutTest >> expectedContentConstraintsHorizontal [

	^ '
*-----------------------**-----------------------*
|                       ||                       |
|                       || Hello Turbo           |
|                       ||                       |
|                       ||                       |
|                       ||                       |
|                       ||                       |
|                       ||                       |
|                       ||                       |
*-----------------------**-----------------------*
' allButFirst
]

{ #category : 'accessing' }
TbGridLayoutTest >> expectedContentConstraintsHorizontal2 [

	^ '
*-----------------------**-----------------------*
|                       ||                       |
|                       || Hello Turbo           |
|                       ||                       |
|                       ||                       |
|                       ||                       |
|                       ||                       |
|                       ||                       |
|                       ||                       |
*-----------------------**-----------------------*
' allButFirst
]

{ #category : 'accessing' }
TbGridLayoutTest >> setUp [

	super setUp.
	
	e1 := TbFrameElement new.
	e1 size: 23@4.
	e2 := TbFrameElement new.
	e2 size: 20@6.
	e3 := TbHelloElement new.
	e3 size: 15@2.
	e3 relocate: 2@2.


]

{ #category : 'accessing' }
TbGridLayoutTest >> testContentConstraintsHorizontal [
	
	space root layout: (TbGridLayout horizontal rowCount: 1).

	space root addChild: e1.
	space root addChild: e2.
	e2 addChild: e3.
	
	e1 constraintsDo: [ :c |
      c horizontal matchParent.
      c vertical matchParent ].
	e2 constraintsDo: [ :c |
      c horizontal matchParent.
      c vertical matchParent ].
	
	self firePulse.
	self content inspect.
	self assert: self content equals: self expectedContentConstraintsHorizontal.

]

{ #category : 'accessing' }
TbGridLayoutTest >> testContentConstraintsHorizontal2 [
	
	space root layout: (TbLinearLayout new).

	space root addChild: e1.
	space root addChild: e2.
	e2 addChild: e3.
	
	e1 constraintsDo: [ :c |
      c horizontal matchParent.
      c vertical matchParent ].
	e2 constraintsDo: [ :c |
      c horizontal matchParent.
      c vertical matchParent ].
	
	self firePulse.
	self assert: self content equals: self expectedContentConstraintsHorizontal.

]
