"
I am a Layout decorator that makes other layouts to be computed only once.

Example:

[[[
	| aLayout |	
	
	aLayout := BlOnceLayout on: BlGridLayout new.
	aLayout isStopped. ""false""
	"".... after layout is done....""
	aLayout isStopped. ""true""
]]]
"
Class {
	#name : #TbOnceLayout,
	#superclass : #TbBasicLayout,
	#instVars : [
		'layout',
		'isStopped',
		'measuredExtent'
	],
	#category : #'Turbo-Core-Layouts-Basic'
}

{ #category : #'instance creation' }
TbOnceLayout class >> on: aBlLayout [
	<return: #BlLayoutOnce>

	^ self new layout: aBlLayout
]

{ #category : #initialization }
TbOnceLayout >> initialize [
	super initialize.

	isStopped := false.
	layout := TbBasicLayout new
]

{ #category : #accessing }
TbOnceLayout >> isStopped [
	^ isStopped
]

{ #category : #accessing }
TbOnceLayout >> isStopped: aBoolean [
	isStopped := aBoolean
]

{ #category : #accessing }
TbOnceLayout >> layout [
	^ layout
]

{ #category : #accessing }
TbOnceLayout >> layout: aBlLayout [
	layout := aBlLayout
]

{ #category : #layout }
TbOnceLayout >> layout: anElement in: aRectangle [
	self isStopped
		ifTrue: [ ^ super layout: anElement in: aRectangle ].
	self layout layout: anElement in: aRectangle
]

{ #category : #measure }
TbOnceLayout >> measure: anElement with: anExtentSpec [
	self isStopped
		ifTrue: [ ^ super measure: anElement with: (BlExtentMeasurementSpec exact: measuredExtent) ].
	self layout measure: anElement with: anExtentSpec
]

{ #category : #'hooks - layout' }
TbOnceLayout >> onLayoutDone: anElement [
	super onLayoutDone: anElement.
	
	isStopped := true.
	anElement childrenDo: [ :aChildElement | aChildElement measuredBounds position: aChildElement position ].
	measuredExtent := anElement extent
]
