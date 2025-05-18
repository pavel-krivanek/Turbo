"
I specifiy the shape to be used at the end of open subpaths when they are stroked.

https://www.w3.org/TR/SVG/painting.html#StrokeLinecapProperty

Possible types are:
 - butt: BlStrokeLineButtCap
 - round: BlStrokeLineRoundCap
 - square: BlStrokeLineSquareCap

Evaluate to see a visual preview:
=== BlStrokeLineCap new inspect ===
"
Class {
	#name : 'TbStrokeLineCap',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#classInstVars : [
		'butt',
		'round',
		'square'
	],
	#category : 'Turbo-Core-Paint-Support',
	#package : 'Turbo-Core',
	#tag : 'Paint-Support'
}

{ #category : 'predefined instances' }
TbStrokeLineCap class >> butt [
	^ butt ifNil: [ butt := TbStrokeLineButtCap new ]
]

{ #category : 'accessing' }
TbStrokeLineCap class >> capName [
	^ self subclassResponsibility
]

{ #category : 'cleanup' }
TbStrokeLineCap class >> cleanUp [
	<script: 'self cleanUp'>
	super cleanUp.

	square := round := butt := nil
]

{ #category : 'predefined instances' }
TbStrokeLineCap class >> round [
	^ round ifNil: [ round := TbStrokeLineRoundCap new ]
]

{ #category : 'predefined instances' }
TbStrokeLineCap class >> square [
	^ square ifNil: [ square := TbStrokeLineSquareCap new ]
]

{ #category : 'printing' }
TbStrokeLineCap >> printOn: aStream [

	self class ~= TbStrokeLineCap
		ifTrue: [ aStream nextPutAll: self class capName ]
		ifFalse: [ aStream nextPutAll: 'Line Cap' ]
]
