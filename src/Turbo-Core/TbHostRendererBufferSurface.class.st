"
I represent a pixel buffer surface to be used by host renderer and host space.

When used, rendering happens in a pixel buffer and than can be displayed in a native window
"
Class {
	#name : #TbHostRendererBufferSurface,
	#superclass : #TbHostRendererSurface,
	#instVars : [
		'stride',
		'buffer',
		'extent'
	],
	#category : #'Turbo-Core-Universe'
}

{ #category : #accessing }
TbHostRendererBufferSurface class >> priority [
	^ 20
]

{ #category : #testing }
TbHostRendererBufferSurface class >> supportedBy: anObject [
	"Return true if a given object supports buffer surface, false otherwise"
	<return: #Boolean>

	^ anObject supportsBufferSurface
]

{ #category : #accessing }
TbHostRendererBufferSurface >> buffer [
	^ buffer
]

{ #category : #accessing }
TbHostRendererBufferSurface >> buffer: aPixelBuffer [
	buffer := aPixelBuffer
]

{ #category : #geometry }
TbHostRendererBufferSurface >> extent [
	"Return actual extent of the underlying surface.
	Note: it may be different from canvas or window extents"
	<return: #Point>
	
	^ extent
]

{ #category : #geometry }
TbHostRendererBufferSurface >> extent: aPoint [
	extent := aPoint
]

{ #category : #initialization }
TbHostRendererBufferSurface >> initializeOn: anObject [
	anObject initializeForBuffer: self
]

{ #category : #initialization }
TbHostRendererBufferSurface >> initializeResourcesOn: aHostRenderer [
	self initializeOn: aHostRenderer
]

{ #category : #rendering }
TbHostRendererBufferSurface >> prepareToRender: aSpace [
	"Dispatch preparation to render through host space based on surface type"
	
	self hostSpace prepareToRender: aSpace onBufferSurface: self
]

{ #category : #presenting }
TbHostRendererBufferSurface >> presentAreas: aCollectionOfRectangles [
	hostSpace presentBufferSurface: self areas: aCollectionOfRectangles
]

{ #category : #rendering }
TbHostRendererBufferSurface >> renderFor: aSpace [
	"Dispatch render process through host space based on surface type"
	
	self hostSpace render: aSpace onBufferSurface: self
]

{ #category : #accessing }
TbHostRendererBufferSurface >> stride [
	^ stride
]

{ #category : #accessing }
TbHostRendererBufferSurface >> stride: aNumber [
	stride := aNumber
]
