"
I define the strategy to be used to draw the border (inside/outside/centered)
"
Class {
	#name : 'TbOutskirts',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#classVars : [
		'Centered',
		'Inside',
		'Outside'
	],
	#category : 'Turbo-Core-Basic-Border',
	#package : 'Turbo-Core',
	#tag : 'Basic-Border'
}

{ #category : 'predefined instances' }
TbOutskirts class >> centered [
	^ Centered ifNil: [ Centered := TbOutskirtsCentered new ]
]

{ #category : 'cleanup' }
TbOutskirts class >> cleanUp [
	<script: 'self cleanUp'>
	super cleanUp.
	Centered := Inside := Outside := nil
]

{ #category : 'predefined instances' }
TbOutskirts class >> inside [
	^ Inside ifNil: [ Inside := TbOutskirtsInside new  ]
]

{ #category : 'predefined instances' }
TbOutskirts class >> outside [
	^ Outside ifNil: [ Outside := TbOutskirtsOutside new ]
]

{ #category : 'visual bounds' }
TbOutskirts >> strokedBounds: aBlBounds of: anElement on: aCanvas [
	^ self subclassResponsibility
]

{ #category : 'testing' }
TbOutskirts >> wantsLayerOn: anElement [
	"Return true if background and border should be rendered on a separate layer,
	false otherwise"
	<return: #Boolean>
	
	^ self subclassResponsibility
]
