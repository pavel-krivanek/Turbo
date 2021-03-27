"
I am a match geometry resizer.
I make sure that geometry is always as big as its owner element and resizes together with it
"
Class {
	#name : #TbGeomMatchResizer,
	#superclass : #TbGeometryResizer,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Turbo-Core-Basic-Support'
}

{ #category : #cleanup }
TbGeomMatchResizer class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #accessing }
TbGeomMatchResizer class >> uniqueInstance [
	"Return unique instance of match resizer.
	Note: match resizer is stateless so it is preferable to share
	the same instance for memory and performance reasons"
	<return: #BlGeomMatchResizer>

	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #resizing }
TbGeomMatchResizer >> adapt: aGeometry to: anElement [
	aGeometry matchElement: anElement
]
