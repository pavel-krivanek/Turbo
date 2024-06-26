Class {
	#name : #TbSquare,
	#superclass : #TbGeometry,
	#instVars : [
		'length',
		'origin'
	],
	#category : #'Turbo-Core-Basic'
}

{ #category : #'geometry bounds' }
TbSquare >> geometryBounds: aBounds [
	"Load my bounds in mutable rectangle.
	@see #geometryBounds for more info"
	<return: #BlBounds>

	^ aBounds
		origin: self origin
		extent: (self length * 2) asPoint
]

{ #category : #accessing }
TbSquare >> length [
	^ length
]

{ #category : #geometry }
TbSquare >> matchExtent: anExtent [
	length := anExtent min / 2.0.
	origin := (anExtent - anExtent min asPoint) / 2.0.

	self extent: anExtent
]

{ #category : #accessing }
TbSquare >> origin [
	^ origin
]
