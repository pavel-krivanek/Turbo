"
I am an abstract geometry resizer.
My main responsibility is to adapt geometry path to element's size.

Every time element's size changes I adapt a given geometry path to an element.
My subclasses must implement adapt:to:
"
Class {
	#name : #TbGeometryResizer,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : #'Turbo-Core-Basic-Support'
}

{ #category : #'instance creation' }
TbGeometryResizer class >> exact: anExtent [
	"Return an instance of exact geometry resizer for a given extent as a point.
	anExtent must not be nil"
	<return: #BlGeometryResizer>
	
	^ TbGeomExactResizer extent: anExtent
]

{ #category : #'instance creation' }
TbGeometryResizer class >> match [
	"Return an instance of resizer that makes geometry be as big as owner element"
	<return: #BlGeometryResizer>

	^ TbGeomMatchResizer uniqueInstance
]

{ #category : #resizing }
TbGeometryResizer >> adapt: aGeometry to: anElement [
	self subclassResponsibility
]
