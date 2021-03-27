"
I represent a form surface to be used by host renderer and host space.

When used, rendering happens in a Form and than can be displayed in a morphic window
"
Class {
	#name : #TbHostRendererFormSurface,
	#superclass : #TbHostRendererSurface,
	#instVars : [
		'externalForm'
	],
	#category : #'Turbo-Core-Universe'
}

{ #category : #accessing }
TbHostRendererFormSurface class >> priority [
	^ 30
]

{ #category : #testing }
TbHostRendererFormSurface class >> supportedBy: anObject [
	"Return true if a given object supports form surface, false otherwise"
	<return: #Boolean>

	^ anObject supportsFormSurface
]

{ #category : #geometry }
TbHostRendererFormSurface >> extent [
	"Return actual extent of the underlying surface.
	Note: it may be different from canvas or window extents"
	<return: #Point>
	
	^ externalForm extent
]

{ #category : #accessing }
TbHostRendererFormSurface >> form [
	^ externalForm
]

{ #category : #initialization }
TbHostRendererFormSurface >> initializeOn: anObject [
	anObject initializeForForm: self
]

{ #category : #initialization }
TbHostRendererFormSurface >> initializeResourcesOn: aHostRenderer [
	externalForm := TbExternalForm extent: self canvasExtent depth: 32.
	externalForm autoRelease.
	externalForm allocateSpace.
	externalForm fillColor: Color transparent.

	self initializeOn: aHostRenderer
]

{ #category : #accessing }
TbHostRendererFormSurface >> pointer [
	^ externalForm pointer
]

{ #category : #rendering }
TbHostRendererFormSurface >> prepareToRender: aSpace [
	"Dispatch preparation to render through host space based on surface type"
	
	self hostSpace prepareToRender: aSpace onFormSurface: self
]

{ #category : #presenting }
TbHostRendererFormSurface >> presentAreas: aCollectionOfRectangles [
	hostSpace presentFormSurface: self areas: aCollectionOfRectangles
]

{ #category : #rendering }
TbHostRendererFormSurface >> renderFor: aSpace [
	"Dispatch render process through host space based on surface type"
	
	self hostSpace render: aSpace onFormSurface: self
]

{ #category : #accessing }
TbHostRendererFormSurface >> stride [
	^ externalForm stride
]
