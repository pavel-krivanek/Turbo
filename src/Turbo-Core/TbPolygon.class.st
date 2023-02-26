"
Example:

BlPolygon vertices: { 
	10@50.
	50@20.
	150@40.
	180@150.
	80@140
}
"
Class {
	#name : #TbPolygon,
	#superclass : #TbGeometry,
	#instVars : [
		'vertices'
	],
	#category : #'Turbo-Core-Basic'
}

{ #category : #'instance creation' }
TbPolygon class >> vertices: aCollection [
	^ self new vertices: aCollection
]

{ #category : #'geometry bounds' }
TbPolygon >> geometryBounds: aBounds [
	"Load my bounds in mutable rectangle.
	@see #geometryBounds for more info"
	<return: #BlBounds>

	^ aBounds
		origin: self vertices min
		corner: self vertices max
]

{ #category : #geometry }
TbPolygon >> matchExtent: anExtent [
	extent := anExtent
]

{ #category : #accessing }
TbPolygon >> vertices [
	<return: #SequenceableCollection of: #Point>

	^ vertices
]

{ #category : #accessing }
TbPolygon >> vertices: aCollectionOfPoints [

	vertices := aCollectionOfPoints.
	extent := vertices max
]
