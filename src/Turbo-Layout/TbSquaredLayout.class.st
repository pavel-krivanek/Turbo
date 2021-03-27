Class {
	#name : #TbSquaredLayout,
	#superclass : #TbLayout,
	#instVars : [
		'layout',
		'isTight'
	],
	#category : #'Turbo-Layout-Squared'
}

{ #category : #'instance creation' }
TbSquaredLayout class >> on: aBlLayout [
	<return: #BlSquaredLayout>

	^ self new layout: aBlLayout
]

{ #category : #accessing }
TbSquaredLayout >> beLoose [
	"Will use the max(width, height) to compute the extent"

	isTight := false
]

{ #category : #accessing }
TbSquaredLayout >> beTight [
	"Will use the min(width, height) to compute the extent"

	isTight := true
]

{ #category : #initialization }
TbSquaredLayout >> initialize [
	super initialize.
	
	layout := BlBasicLayout new.
	isTight := false "be loose by default"
]

{ #category : #testing }
TbSquaredLayout >> isLoose [
	^ self isTight not
]

{ #category : #testing }
TbSquaredLayout >> isTight [
	^ isTight
]

{ #category : #accessing }
TbSquaredLayout >> layout [
	^ layout
]

{ #category : #accessing }
TbSquaredLayout >> layout: aLayout [
	layout := aLayout
]

{ #category : #measure }
TbSquaredLayout >> layout: anElement in: aRectangle [
	self layout layout: anElement in: aRectangle
]

{ #category : #measure }
TbSquaredLayout >> measure: anElement with: anExtentSpec [
	| aMeasuredExtent anExtent |
	
	"first measure to determine how big the element want to be"
	self layout measure: anElement with: anExtentSpec.

	aMeasuredExtent := anElement measuredExtent.

	"then compute squared extent"
	anExtent := self isTight
		ifTrue: [ aMeasuredExtent min asPoint ]
		ifFalse: [ aMeasuredExtent max asPoint ].

	 aMeasuredExtent = anExtent
		ifTrue: [ ^ self ].

	"and finally re-measure everything with squared extent"
	self layout measure: anElement with: (BlExtentMeasurementSpec exact: anExtent)
]
