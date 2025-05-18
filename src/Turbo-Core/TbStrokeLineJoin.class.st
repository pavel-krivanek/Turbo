"
I specify the shape to be used at the corners of paths or basic shapes when they are stroked.

https://www.w3.org/TR/SVG/painting.html#StrokeLinejoinProperty

Possible types are:
 - bevel: BlStrokeLineBevelJoin
 - miter: BlStrokeLineMiterJoin
 - round: BlStrokeLineRoundJoin

Evaluate to see a visual preview:
=== BlStrokeLineJoin new inspect ===
"
Class {
	#name : 'TbStrokeLineJoin',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#classInstVars : [
		'bevel',
		'miter',
		'round'
	],
	#category : 'Turbo-Core-Paint-Support',
	#package : 'Turbo-Core',
	#tag : 'Paint-Support'
}

{ #category : 'predefined instances' }
TbStrokeLineJoin class >> bevel [
	^ bevel ifNil: [ bevel := TbStrokeLineBevelJoin new ]
]

{ #category : 'cleanup' }
TbStrokeLineJoin class >> cleanUp [
	<script: 'self cleanUp'>
	super cleanUp.

	bevel := miter := round := nil
]

{ #category : 'accessing' }
TbStrokeLineJoin class >> joinName [
	^ self subclassResponsibility
]

{ #category : 'predefined instances' }
TbStrokeLineJoin class >> miter [
	^ miter ifNil: [ miter := TbStrokeLineMiterJoin new ]
]

{ #category : 'predefined instances' }
TbStrokeLineJoin class >> round [
	^ round ifNil: [ round := TbStrokeLineRoundJoin new ]
]

{ #category : 'printing' }
TbStrokeLineJoin >> printOn: aStream [

	self class ~= TbStrokeLineJoin
		ifTrue: [ aStream nextPutAll: self class joinName ]
		ifFalse: [ aStream nextPutAll: 'Line Join' ]
]
