"
I am an exact geometry resizer.
I make sure that geometry has a concrete size independent from its owner element
"
Class {
	#name : #TbGeomExactResizer,
	#superclass : #TbGeometryResizer,
	#instVars : [
		'extent'
	],
	#category : #'Turbo-Core-Basic-Support'
}

{ #category : #resizing }
TbGeomExactResizer >> adapt: aGeometry to: anElement [
	aGeometry matchExtent: self extent
]

{ #category : #accessing }
TbGeomExactResizer >> extent [
	^ extent
]

{ #category : #accessing }
TbGeomExactResizer >> extent: aPoint [
	extent := aPoint
]
