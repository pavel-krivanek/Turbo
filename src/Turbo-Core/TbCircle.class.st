Class {
	#name : #TbCircle,
	#superclass : #TbGeometry,
	#instVars : [
		'radius',
		'origin'
	],
	#category : #'Turbo-Core-Basic'
}

{ #category : #'geometry bounds' }
TbCircle >> geometryBounds: aBounds [
	"Load my bounds in mutable rectangle.
	@see #geometryBounds for more info"
	<return: #BlBounds>

	^ aBounds
		origin: self origin
		extent: (self radius * 2) asPoint
]

{ #category : #initialization }
TbCircle >> initialize [
	super initialize.
	
	radius := 0.
	origin := 0@0
]

{ #category : #geometry }
TbCircle >> matchExtent: anExtent [
	radius := anExtent min / 2.0.
	origin := (anExtent - anExtent min asPoint) / 2.0.

	self extent: anExtent
]

{ #category : #accessing }
TbCircle >> origin [
	^ origin
]

{ #category : #accessing }
TbCircle >> radius [
	^ radius
]
