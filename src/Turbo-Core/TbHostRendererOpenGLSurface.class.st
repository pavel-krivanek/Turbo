"
I represent an OpenGL surface to be used by host renderer and host space.

When used, rendering happens using OpenGL context and than can be displayed in a native window
"
Class {
	#name : 'TbHostRendererOpenGLSurface',
	#superclass : 'TbHostRendererSurface',
	#instVars : [
		'context',
		'extent'
	],
	#category : 'Turbo-Core-Universe',
	#package : 'Turbo-Core',
	#tag : 'Universe'
}

{ #category : 'accessing' }
TbHostRendererOpenGLSurface class >> priority [
	^ 10
]

{ #category : 'testing' }
TbHostRendererOpenGLSurface class >> supportedBy: anObject [
	"Return true if a given object supports OpenGL surface, false otherwise"
	<return: #Boolean>

	^ anObject supportsOpenGLSurface
]

{ #category : 'accessing' }
TbHostRendererOpenGLSurface >> context [
	^ context
]

{ #category : 'accessing' }
TbHostRendererOpenGLSurface >> context: anObject [
	context := anObject
]

{ #category : 'accessing' }
TbHostRendererOpenGLSurface >> extent [
	^ extent
]

{ #category : 'accessing' }
TbHostRendererOpenGLSurface >> extent: anObject [
	extent := anObject
]

{ #category : 'initialization' }
TbHostRendererOpenGLSurface >> initializeOn: anObject [	
	anObject initializeForOpenGL: self
]

{ #category : 'initialization' }
TbHostRendererOpenGLSurface >> initializeResourcesOn: aHostRenderer [
	"Initialize me and host renderer depending on surface type.
	must be implemented by subclasses"
	
	self initializeOn: aHostRenderer
]

{ #category : 'rendering' }
TbHostRendererOpenGLSurface >> prepareToRender: aSpace [
	"Dispatch preparation to render through host space based on surface type"
	
	self hostSpace prepareToRender: aSpace onOpenGLSurface: self
]

{ #category : 'presenting' }
TbHostRendererOpenGLSurface >> presentAreas: aCollectionOfRectangles [
	hostSpace presentOpenGLSurface: self areas: aCollectionOfRectangles
]

{ #category : 'rendering' }
TbHostRendererOpenGLSurface >> renderFor: aSpace [
	"Dispatch render process through host space based on surface type"
	
	self hostSpace render: aSpace onOpenGLSurface: self
]
