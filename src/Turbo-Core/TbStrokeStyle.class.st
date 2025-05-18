Class {
	#name : 'TbStrokeStyle',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'lineCap',
		'lineJoin',
		'miterLimit',
		'dashArray',
		'dashOffset'
	],
	#category : 'Turbo-Core-Paint-Support',
	#package : 'Turbo-Core',
	#tag : 'Paint-Support'
}

{ #category : 'instance creation' }
TbStrokeStyle class >> dashed [
	<gtExample>
	^ self new
		lineCap: TbStrokeLineCap butt;
		lineJoin: TbStrokeLineJoin miter;
		miterLimit: 4.0;
		dashArray: #(6 4.2);
		dashOffset: 0
]

{ #category : 'instance creation' }
TbStrokeStyle class >> default [
	<gtExample>
	^ self new
		lineCap: TbStrokeLineCap butt;
		lineJoin: TbStrokeLineJoin miter;
		miterLimit: 4.0;
		dashArray: #();
		dashOffset: 0
]

{ #category : 'copying' }
TbStrokeStyle >> copyWithLineCap: aLineCap [
	^ self copy lineCap: aLineCap
]

{ #category : 'copying' }
TbStrokeStyle >> copyWithLineJoin: aLineJoin [
	^ self copy lineJoin: aLineJoin
]

{ #category : 'accessing' }
TbStrokeStyle >> dashArray [
	^ dashArray
]

{ #category : 'accessing' }
TbStrokeStyle >> dashArray: anArray [
	dashArray := anArray
]

{ #category : 'accessing' }
TbStrokeStyle >> dashOffset [
	^ dashOffset
]

{ #category : 'accessing' }
TbStrokeStyle >> dashOffset: aNumber [
	dashOffset := aNumber
]

{ #category : 'accessing' }
TbStrokeStyle >> lineCap [
	^ lineCap
]

{ #category : 'accessing' }
TbStrokeStyle >> lineCap: aBlStrokeLineCap [
	lineCap := aBlStrokeLineCap
]

{ #category : 'accessing' }
TbStrokeStyle >> lineJoin [
	^ lineJoin
]

{ #category : 'accessing' }
TbStrokeStyle >> lineJoin: aBlStrokeLineJoin [
	lineJoin := aBlStrokeLineJoin
]

{ #category : 'accessing' }
TbStrokeStyle >> miterLimit [
	^ miterLimit
]

{ #category : 'accessing' }
TbStrokeStyle >> miterLimit: aNumber [
	miterLimit := aNumber
]
