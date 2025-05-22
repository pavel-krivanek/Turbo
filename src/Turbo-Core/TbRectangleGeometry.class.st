"
I am a rectangular geometry with support of rounded corners.

I can play a role of a square if both width and height are equal. In this case can be created using a predefined factory method:

	BlRectangle length: 20 ""creates a square with side length of 20""
	
In order to explicitely create a rectangle use extent:

	BlRectangle extent: 50@30 ""create a rectangle with width 50 and height 30""
"
Class {
	#name : 'TbRectangleGeometry',
	#superclass : 'TbGeometry',
	#category : 'Turbo-Core-Basic',
	#package : 'Turbo-Core',
	#tag : 'Basic'
}

{ #category : 'geometry testing' }
TbRectangleGeometry >> containsPoint: aPoint in: aBlElement [
	"does not use standard Pharo rectangle logic"
	| origin corner |
	
	origin := (self extent / 2) negated.
	corner := origin + self extent.
	
	^ origin <= aPoint and: [aPoint <= corner]
]

{ #category : 'geometry' }
TbRectangleGeometry >> matchExtent: aPoint [
	extent := aPoint
]

{ #category : 'visual bounds' }
TbRectangleGeometry >> strokedBoundsCentered: aBlBounds of: aBlElement on: aCanvas [ 
	<return: #BlBounds>

	^ (self geometryBounds: aBlBounds) expandBy: aBlElement border width / 2.0
]

{ #category : 'visual bounds' }
TbRectangleGeometry >> strokedBoundsOutside: aBlBounds of: aBlElement on: aCanvas [ 
	<return: #BlBounds>

	^ (self geometryBounds: aBlBounds) expandBy: aBlElement border width
]
