"
The geometry is used to define the geometry to be drawn and the interaction area.
"
Class {
	#name : 'TbGeometry',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'extent'
	],
	#category : 'Turbo-Core-Basic',
	#package : 'Turbo-Core',
	#tag : 'Basic'
}

{ #category : 'converting' }
TbGeometry >> asElement [
	"Create an appropriate element with me as its geometry.
	By default create an instance of the basic BlElement simply setting its
	geometry to me. Subclasses may be converted to more specific elements"
	<return: #BlElement>

	^ TbElement new
		size: self extent;
		background: (Color gray alpha: 0.4);
		border: (TbBorder builder paint: Color gray; width: 2; build);
		geometry: self
]

{ #category : 'geometry testing' }
TbGeometry >> containsPoint: aPoint in: aBlElement [

	self subclassResponsibility 
]

{ #category : 'accessing' }
TbGeometry >> extent [
	^ extent
]

{ #category : 'accessing' }
TbGeometry >> extent: aPoint [
	"The argument has to be a Point of numbers (integer or float).
	Do not try to provide a fraction as x or y of the point!
	aPoint must not be nil
	aPoint must be positive"

	self
		assert: [ aPoint x >= 0 and: [ aPoint y >= 0 ] ]
		description: [ 'Geometry extent must be non-negative!' ].

	extent := aPoint
]

{ #category : 'geometry bounds' }
TbGeometry >> geometryBounds [
	"Return my geometry bounds.
	This property is different from #visualBounds in the sense that I don't take stroke into account.
	Override geometryBounds: to customize computation"
	<return: #Rectangle>

	^ (self geometryBounds: TbBounds new) asRectangle
]

{ #category : 'geometry bounds' }
TbGeometry >> geometryBounds: aBounds [
	"Load my bounds in mutable rectangle.
	@see #geometryBounds for more info"
	<return: #BlBounds>

	^ aBounds
		origin: 0@0
		extent: self extent
]

{ #category : 'initialization' }
TbGeometry >> initialize [
	super initialize.
	
	extent := 0@0.
]

{ #category : 'geometry' }
TbGeometry >> matchElement: anElement [
	self matchExtent: anElement extent
]

{ #category : 'geometry' }
TbGeometry >> matchExtent: aPoint [
	"Resize geometry to exactly match provided extent as a Point"

	self subclassResponsibility
]

{ #category : 'copying' }
TbGeometry >> postCopy [
	self releaseCache
]

{ #category : 'cache' }
TbGeometry >> releaseCache [
	
	"do nothing"
]

{ #category : 'visual bounds' }
TbGeometry >> strokedBounds: aBlBounds of: anElement on: aCanvas [
	"Return stroked bounds of a geometry if it would be stroked
	according to element's border configuration.
	Dispatch through border's BlStrokeType first"
	<return: #BlBounds>

	^ anElement outskirts strokedBounds: aBlBounds of: anElement on: aCanvas
]

{ #category : 'visual bounds' }
TbGeometry >> strokedBoundsCentered: aBlBounds of: anElement on: aCanvas [
	
	self subclassResponsibility 
]

{ #category : 'visual bounds' }
TbGeometry >> strokedBoundsInside: aBlBounds of: anElement on: aCanvas [
	"Stroked inside bounds property is equal to geometry bounds"
	<return: #BlBounds>

	^ self geometryBounds: aBlBounds
]

{ #category : 'visual bounds' }
TbGeometry >> strokedBoundsOutside: aBlBounds of: anElement on: aCanvas [
	
	self subclassResponsibility 
]
