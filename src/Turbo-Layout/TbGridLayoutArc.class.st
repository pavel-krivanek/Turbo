"
I represent an association of span interval, associated value and validity flag.

I am used by grid layout instead of Dictionary of span <-> value key-value pair for performance reasons. 

Internal Representation and Key Implementation Points.

Instance Variables
	span:		<BlGridLayoutInterval>
	valid:		<Boolean>
	value:		<BlGridMutableInteger>
"
Class {
	#name : #TbGridLayoutArc,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'span',
		'value',
		'valid'
	],
	#category : #'Turbo-Layout-Grid-Utilities'
}

{ #category : #'instance creation' }
TbGridLayoutArc class >> span: span value: value [
	^ self new
		span: span;
		value: value
]

{ #category : #initialization }
TbGridLayoutArc >> initialize [
	super initialize.
	
	valid := true
]

{ #category : #printing }
TbGridLayoutArc >> printOn: aStream [
	aStream
		nextPutAll: self span asString;
		nextPutAll: ' -> ';
		nextPutAll: self value asString;
		nextPutAll: ' : ';
		nextPutAll: self valid asString
]

{ #category : #accessing }
TbGridLayoutArc >> span [
	<return: #BlGridLayoutInterval>

	^ span
]

{ #category : #accessing }
TbGridLayoutArc >> span: aBlGridLayoutInterval [
	"Debugging internal implementation"
	self
		assert: [ aBlGridLayoutInterval isKindOf: TbGridLayoutInterval ]
		description: [ 'Span must be a special type of Interval' ].

	span := aBlGridLayoutInterval
]

{ #category : #accessing }
TbGridLayoutArc >> valid [
	<return: #Boolean>

	^ valid
]

{ #category : #accessing }
TbGridLayoutArc >> valid: aBoolean [
	valid := aBoolean
]

{ #category : #accessing }
TbGridLayoutArc >> value [
	<return: #BlGridMutableInteger>

	^ value
]

{ #category : #accessing }
TbGridLayoutArc >> value: aBlGridMutableInteger [
	value := aBlGridMutableInteger
]
