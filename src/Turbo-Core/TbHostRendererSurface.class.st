"
I am a mediator between host space and host renderer
"
Class {
	#name : #TbHostRendererSurface,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'hostSpace',
		'hostRenderer'
	],
	#category : #'Turbo-Core-Universe'
}

{ #category : #accessing }
TbHostRendererSurface class >> allSurfaces [
	"Return a collection of all possible surfaces"
	<return: #Collection of: #'BlHostRendererSurface class'>

	^ self allSubclasses
]

{ #category : #testing }
TbHostRendererSurface class >> supportedBy: anObject [
	"Return true if a given object supports this surface, false otherwise"
	<return: #Boolean>
	
	^ self subclassResponsibility
]

{ #category : #geometry }
TbHostRendererSurface >> canvasExtent [
	"Return current canvas extent in pixels as a Point.
	Note, that canvas extent is different from windowExtent
	and is normally x2 bigger on retina screens"
	<return: #Point>

	^ self hostSpace canvasExtent
]

{ #category : #geometry }
TbHostRendererSurface >> extent [
	"Return an actual extent of the underlying surface.
	Note: between frames #extent may be different from canvas or window extents because
	those two methods return immediate/current window extent by asking host window directly"
	<return: #Point>

	^ self subclassResponsibility
]

{ #category : #accessing }
TbHostRendererSurface >> hostRenderer [
	^ hostRenderer
]

{ #category : #accessing }
TbHostRendererSurface >> hostRenderer: anObject [
	hostRenderer := anObject
]

{ #category : #accessing }
TbHostRendererSurface >> hostSpace [
	^ hostSpace
]

{ #category : #accessing }
TbHostRendererSurface >> hostSpace: anObject [
	hostSpace := anObject
]

{ #category : #initialization }
TbHostRendererSurface >> initializeOn: anObject [
	"Initialize a given object to work with this surface.
	must be implemented by subclasses"
	
	self subclassResponsibility
]

{ #category : #initialization }
TbHostRendererSurface >> initializeResourcesOn: aHostRenderer [
	"Initialize me and host renderer depending on surface type.
	must be implemented by subclasses"
	
	self subclassResponsibility
]

{ #category : #rendering }
TbHostRendererSurface >> prepareToRender: aSpace [
	"Dispatch preparation to render through host space based on surface type"
	
	self subclassResponsibility
]

{ #category : #presenting }
TbHostRendererSurface >> presentAreas: aCollectionOfRectangles [
	self subclassResponsibility
]

{ #category : #rendering }
TbHostRendererSurface >> renderFor: aSpace [
	"Dispatch render process through host space based on surface type"
	
	self subclassResponsibility
]

{ #category : #geometry }
TbHostRendererSurface >> scaleFactor [
	"Return a scaling factor from space to window coordinates.
	On high dpi (retina) displays scaling factor is > 1"
	<return: #Point>
	
	^ self hostSpace scaleFactor
]

{ #category : #geometry }
TbHostRendererSurface >> windowExtent [
	"Return current window extent in pixels as a Point.
	Note, that window extent is different from canvasExtent
	and is normally x2 smaller on retina screens"
	<return: #Point>

	^ self hostSpace windowExtent
]
