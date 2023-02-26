"
I am a BlBorder builder.

BlBorder builder
	paint: Color red;
	width: 10;
	build
"
Class {
	#name : #TbBorderBuilder,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'paint',
		'width',
		'lineCap',
		'lineJoin',
		'miterLimit',
		'dashArray',
		'dashOffset',
		'opacity'
	],
	#category : #'Turbo-Core-Basic-Border'
}

{ #category : #builder }
TbBorderBuilder >> build [
	^ TbBorder basicNew
		initialize;
		paint: self paint;
		width: self width;
		style: self buildStyle;
		opacity: self opacity;
		yourself
]

{ #category : #builder }
TbBorderBuilder >> buildStyle [
	^ TbStrokeStyle new
		lineCap: self lineCap;
		lineJoin: self lineJoin;
		miterLimit: self miterLimit;
		dashArray: self dashArray;
		dashOffset: self dashOffset
]

{ #category : #styles }
TbBorderBuilder >> capRound [
	self lineCap: TbStrokeLineCap round
]

{ #category : #accessing }
TbBorderBuilder >> dashArray [
	^ dashArray
]

{ #category : #accessing }
TbBorderBuilder >> dashArray: anObject [
	dashArray := anObject
]

{ #category : #accessing }
TbBorderBuilder >> dashOffset [
	^ dashOffset
]

{ #category : #accessing }
TbBorderBuilder >> dashOffset: anObject [
	dashOffset := anObject
]

{ #category : #styles }
TbBorderBuilder >> dashed [
	dashOffset := 0.
	dashArray := #(6 4.2)
]

{ #category : #styles }
TbBorderBuilder >> dashedSmall [
	dashOffset := 0.
	dashArray := #(3 2)
]

{ #category : #initialization }
TbBorderBuilder >> defaultDashArray [
	^ #()
]

{ #category : #initialization }
TbBorderBuilder >> defaultDashOffset [
	^ 0.0
]

{ #category : #initialization }
TbBorderBuilder >> defaultLineCap [
	^ TbStrokeLineCap butt
]

{ #category : #initialization }
TbBorderBuilder >> defaultLineJoin [
	^ TbStrokeLineJoin miter
]

{ #category : #initialization }
TbBorderBuilder >> defaultMiterLimit [
	^ 4.0
]

{ #category : #initialization }
TbBorderBuilder >> defaultOpacity [
	^ 1.0
]

{ #category : #initialization }
TbBorderBuilder >> defaultPaint [
	^ TbPaint transparent 
]

{ #category : #initialization }
TbBorderBuilder >> defaultWidth [
	^ 1.0
]

{ #category : #initialization }
TbBorderBuilder >> initialize [
	super initialize.
	
	paint := self defaultPaint.
	width := self defaultWidth.
	lineCap := self defaultLineCap.
	lineJoin := self defaultLineJoin.
	miterLimit := self defaultMiterLimit.
	dashArray := self defaultDashArray.
	dashOffset := self defaultDashOffset.
	opacity := self defaultOpacity
]

{ #category : #styles }
TbBorderBuilder >> joinRound [
	self lineJoin: TbStrokeLineJoin round
]

{ #category : #accessing }
TbBorderBuilder >> lineCap [
	<return: #BlStrokeLineCap>

	^ lineCap
]

{ #category : #accessing }
TbBorderBuilder >> lineCap: aBlStrokeLineCap [
	lineCap := aBlStrokeLineCap
]

{ #category : #accessing }
TbBorderBuilder >> lineJoin [
	<return: #BlStrokeLineJoin>

	^ lineJoin
]

{ #category : #accessing }
TbBorderBuilder >> lineJoin: aBlStrokeLineJoin [
	lineJoin := aBlStrokeLineJoin
]

{ #category : #accessing }
TbBorderBuilder >> miterLimit [
	^ miterLimit
]

{ #category : #accessing }
TbBorderBuilder >> miterLimit: anObject [
	miterLimit := anObject
]

{ #category : #accessing }
TbBorderBuilder >> opacity [
	^ opacity
]

{ #category : #accessing }
TbBorderBuilder >> opacity: anObject [
	opacity := anObject
]

{ #category : #accessing }
TbBorderBuilder >> paint [
	^ paint
]

{ #category : #accessing }
TbBorderBuilder >> paint: anObject [
	paint := anObject
]

{ #category : #styles }
TbBorderBuilder >> solid [
	dashOffset := 0.0.
	dashArray := #()
]

{ #category : #accessing }
TbBorderBuilder >> width [
	^ width
]

{ #category : #accessing }
TbBorderBuilder >> width: anObject [
	width := anObject
]
