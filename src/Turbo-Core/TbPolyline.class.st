"
Example:

BlPolyline vertices: { 
	10@50.
	50@20.
	150@40.
	180@150.
	80@140
}
"
Class {
	#name : #TbPolyline,
	#superclass : #TbGeometry,
	#instVars : [
		'vertices'
	],
	#category : #'Turbo-Core-Basic'
}

{ #category : #'instance creation' }
TbPolyline class >> vertices: aCollection [
	^ self new vertices: aCollection
]

{ #category : #converting }
TbPolyline >> asElement [
	^ super asElement
		background: Color transparent;
		outskirts: TbOutskirts centered
]

{ #category : #'geometry testing' }
TbPolyline >> containsPoint: aPoint in: anElement on: aSpartaCanvas [
	"Note: I am a fallback method to determine if a point lies within a geometry path
	when geometry is complex and it is mathematically difficult to compute manually"
	<return: #Boolean>
	| aPath |

	aPath := pathCache pathOnSpartaCanvas: aSpartaCanvas.
	^ aSpartaCanvas stroke
		path: aPath;
		width: anElement border width;
		containsPoint: aPoint
]

{ #category : #'geometry bounds' }
TbPolyline >> geometryBounds: aBounds [
	"Load my bounds in mutable rectangle.
	@see #geometryBounds for more info"
	<return: #BlBounds>

	^ aBounds
		origin: self vertices min
		corner: self vertices max
]

{ #category : #geometry }
TbPolyline >> matchExtent: anExtent [
	extent := anExtent
]

{ #category : #accessing }
TbPolyline >> vertices [
	<return: #SequenceableCollection of: #Point>

	^ vertices
]

{ #category : #accessing }
TbPolyline >> vertices: aCollectionOfPoints [

	vertices := aCollectionOfPoints.
	extent := vertices max.
]
