"
I represent the border of a BlElement.

Example:

BlBorder builder
	paint: Color red;
	width: 10;
	build
"
Class {
	#name : #TbBorder,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'paint',
		'width',
		'style',
		'opacity'
	],
	#classInstVars : [
		'empty'
	],
	#category : #'Turbo-Core-Basic-Border'
}

{ #category : #'instance creation' }
TbBorder class >> builder [
	^ BlBorderBuilder new
]

{ #category : #cleanup }
TbBorder class >> cleanUp [
	super cleanUp.
	
	empty := nil
]

{ #category : #accessing }
TbBorder class >> empty [
	^ empty ifNil: [ empty := self paint: BlPaint transparent width: 0 ]
]

{ #category : #'instance creation' }
TbBorder class >> new [
	self error: 'Use one of the builder methods'
]

{ #category : #'instance creation' }
TbBorder class >> paint: aPaint [

	^ self builder
		paint: aPaint;
		build
]

{ #category : #'instance creation' }
TbBorder class >> paint: aPaint width: aNumber [

	^ self builder
		paint: aPaint;
		width: aNumber;
		build
]

{ #category : #copy }
TbBorder >> copyWithOpacity: aNumber [
	self
		assert: [ aNumber isNotNil ]
		description: [ 'Opacity must not be nil' ].

	^ self class basicNew
		initialize;
		paint: paint;
		style: style;
		width: width;
		opacity: aNumber;
		yourself
]

{ #category : #copy }
TbBorder >> copyWithPaint: aPaint [

	self
		assert: [ aPaint isNotNil ]
		description: [ 'Paint must not be nil' ].

	^ self class basicNew
		initialize;
		paint: aPaint;
		style: style;
		width: width;
		opacity: opacity;
		yourself
]

{ #category : #copy }
TbBorder >> copyWithStyle: aStrokeStyle [

	self
		assert: [ aStrokeStyle isNotNil ]
		description: [ 'Style must not be nil' ].

	^ self class basicNew
		initialize;
		paint: paint;
		style: aStrokeStyle;
		width: width;
		opacity: opacity;
		yourself
]

{ #category : #copy }
TbBorder >> copyWithWidth: aWidth [

	self
		assert: [ aWidth isNotNil ]
		description: [ 'Width must not be nil' ].

	^ self class basicNew
		initialize;
		paint: paint;
		style: style;
		width: aWidth;
		opacity: opacity;
		yourself
]

{ #category : #testing }
TbBorder >> isTransparent [
	"Return true if I am is transparent and should not be rendered,
	false otherwise"
	<return: #Boolean>

	^ width isZero
]

{ #category : #testing }
TbBorder >> isVisible [
	"Return true if I am visible and should be rendered, false otherwise.
	Note: Non-zero border with transparent paint is still needs to be rendered,
	since it removes an overlapping background area"
	<return: #Boolean>

	^ width isZero not
]

{ #category : #accessing }
TbBorder >> opacity [
	<return: #Number>

	^ opacity
]

{ #category : #accessing }
TbBorder >> opacity: aNumber [
	self
		assert: [ aNumber isNotNil ]
		description: [ 'Opacity must not be nil' ].
	self
		assert: [ aNumber between: 0.0 and: 1.0 ]
		description: [ 'Opacity value must be within interval [0..1]' ].

	opacity isNotNil
		ifTrue: [ (BlImmutableObjectChangeError object: self) signal ].

	opacity := aNumber
]

{ #category : #accessing }
TbBorder >> paint [
	<return: #BlPaint>

	^ paint
]

{ #category : #accessing }
TbBorder >> paint: aBlPaint [
	self
		assert: [ aBlPaint isNotNil ]
		description: [ 'Paint must not be nil' ].

	paint isNotNil
		ifTrue: [ (BlImmutableObjectChangeError object: self) signal ].

	paint := aBlPaint asBlPaint
]

{ #category : #accessing }
TbBorder >> style [
	<return: #BlStrokeStyle>

	^ style
]

{ #category : #accessing }
TbBorder >> style: aBlStrokeStyle [
	self
		assert: [ aBlStrokeStyle isNotNil ]
		description: [ 'Style must not be nil' ].

	style isNotNil
		ifTrue: [ (BlImmutableObjectChangeError object: self) signal ].

	style := aBlStrokeStyle
]

{ #category : #accessing }
TbBorder >> width [
	<return: #Number>

	^ width
]

{ #category : #accessing }
TbBorder >> width: aNumber [
	self
		assert: [ aNumber isNotNil ]
		description: [ 'Width must not be nil' ].
	self
		assert: [ aNumber >= 0 ]
		description: [ 'Width vmust not be negative' ].

	width isNotNil
		ifTrue: [ (BlImmutableObjectChangeError object: self) signal ].
	
	width := aNumber
]
