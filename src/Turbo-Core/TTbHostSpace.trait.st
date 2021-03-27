"
I define the public API needed to be used by the Universe and the Spaces.
I define the public API that Host Spaces must provide.
This API is mostly used by  the Universe and the Host-Independent Spaces.
An Host Space is an  actual screen area provided by the underlying Host.
This area is typically an host-specific window.
"
Trait {
	#name : #TTbHostSpace,
	#traits : 'TTbSpaceProperties',
	#classTraits : 'TTbSpaceProperties classTrait',
	#category : #'Turbo-Core-Universe'
}

{ #category : #'host space - accessing' }
TTbHostSpace >> canvasExtent [
	"Return a window canvas size in user coordinates.
	This size may differ from the window size on high dpi (retina) screens.
	In most cases canvas is x2 larger than window in pixel on retina screens."
	<return: #Point>

	^ self explicitRequirement
]

{ #category : #'host space - displaying' }
TTbHostSpace >> close [
	self explicitRequirement
]

{ #category : #'host space - cursor' }
TTbHostSpace >> cursor: aCursor [
	"Change current cursor image/view to the given one"

	self explicitRequirement
]

{ #category : #'host space - accessing' }
TTbHostSpace >> densityDpi [
	"Return the screen density expressed as dots-per-inch"
	<return: #Number>
	
	^ self explicitRequirement
]

{ #category : #'host space - events' }
TTbHostSpace >> enqueueEvent: aBlEvent [
	"Enqueue a given Bloc Event in the event queue.
	I am useful for testing and benchmark purposes"

	self eventFetcher enqueueEvent: aBlEvent.
	self space requestNextPulse
]

{ #category : #'host space - events' }
TTbHostSpace >> eventFetcher [
	"Return event fetcher used to enqueue events that should be
	processed in the beginning of every frame"
	<return: #BlHostEventFetcher>

	^ self explicitRequirement
]

{ #category : #'host space - events' }
TTbHostSpace >> fetchedEventsDo: aBlock [
	"Flush event queue and evaluate a given block with every queued event as argument"

	self eventFetcher fetchedEventsDo: aBlock
]

{ #category : #'host space - testing' }
TTbHostSpace >> hasResized [
	"Return true if renderer extent changed.
	It may happen if window moved between displays with different dpi,
	e.g. from normal display to retina"
	<return: #Boolean>

	^ self renderer hasResized
]

{ #category : #'host space - displaying' }
TTbHostSpace >> hide [
	self explicitRequirement
]

{ #category : #'host space - accessing' }
TTbHostSpace >> host [
	"Return a host that was used to create this host space"
	<return: #BlHost>

	^ self explicitRequirement
]

{ #category : #'host space - accessing' }
TTbHostSpace >> host: aBlHost [
	"Assign a host that was used to create this host space"
	
	self explicitRequirement
]

{ #category : #initialization }
TTbHostSpace >> initializeForBuffer: aBufferSurface [
	"Asks host space to initialize itself to be used together with a pixel buffer surface.
	Default implementation simply connects renderer, host space and surface together"

	aBufferSurface hostSpace: self.
	aBufferSurface hostRenderer: self renderer.

	self renderer surface: aBufferSurface
]

{ #category : #initialization }
TTbHostSpace >> initializeForForm: anFormSurface [
	"Asks host space to initialize itself to be used together with a Form surface.
	Default implementation simply connects renderer, host space and surface together"

	anFormSurface hostSpace: self.
	anFormSurface hostRenderer: self renderer.

	self renderer surface: anFormSurface
]

{ #category : #initialization }
TTbHostSpace >> initializeForOpenGL: anOpenGLSurface [
	"Asks host space to initialize itself to be used together with an OpenGL surface.
	Default implementation simply connects renderer, host space and surface together"

	anOpenGLSurface hostSpace: self.
	anOpenGLSurface hostRenderer: self renderer.

	self renderer surface: anOpenGLSurface
]

{ #category : #'host space - testing' }
TTbHostSpace >> isVisible [
	"Return true if underlying window is shown, false otherwise.
	Note: If window was shown and then minimized it is still considered to be visible.
	Window can become invisible by asking it to hide"
	<return: #Boolean>

	^ self explicitRequirement
]

{ #category : #'host space - displaying' }
TTbHostSpace >> maximize [

	self explicitRequirement
]

{ #category : #'host space - displaying' }
TTbHostSpace >> maximized [

	^ self explicitRequirement
]

{ #category : #'host space - displaying' }
TTbHostSpace >> minimize [

	self explicitRequirement
]

{ #category : #'host space - displaying' }
TTbHostSpace >> minimized [

	^ self explicitRequirement
]

{ #category : #'host space - displaying' }
TTbHostSpace >> open [
	self explicitRequirement
]

{ #category : #'host space - rendering' }
TTbHostSpace >> prepareToRender: aBlSpace onBufferSurface: aBlHostRendererBufferSurface [
	"Prepare host space to a given space on a buffer surface.
	By default dispatch directly to the renderer"

	self renderer prepareToRender: aBlSpace
]

{ #category : #'host space - rendering' }
TTbHostSpace >> prepareToRender: aBlSpace onFormSurface: aBlHostRendererFormSurface [
	"Prepare host space to a given space on a Form surface.
	By default dispatch directly to the renderer"

	self renderer prepareToRender: aBlSpace
]

{ #category : #'host space - rendering' }
TTbHostSpace >> prepareToRender: aBlSpace onOpenGLSurface: aBlHostRendererOpenGLSurface [
	"Prepare host space to a given space on an OpenGL surface.
	By default dispatch directly to the renderer"

	self renderer prepareToRender: aBlSpace
]

{ #category : #'host space - rendering' }
TTbHostSpace >> presentBufferSurface: aBlHostRendererBufferSurface areas: aCollectionOfAreas [
	self explicitRequirement
]

{ #category : #'host space - rendering' }
TTbHostSpace >> presentFormSurface: aBlHostRendererFormSurface areas: aCollectionOfAreas [
	self explicitRequirement
]

{ #category : #'host space - rendering' }
TTbHostSpace >> presentOpenGLSurface: aBlHostRendererOpenGLSurface areas: aCollectionOfAreas [
	self explicitRequirement
]

{ #category : #'host space - rendering' }
TTbHostSpace >> render: aSpace [
	"Render a given abstract space on an underlying window or visual area"

	self renderer render: aSpace
]

{ #category : #'host space - rendering' }
TTbHostSpace >> render: aBlSpace onBufferSurface: aBlHostRendererBufferSurface [
	"Render a given space on an a buffer surface.
	By default dispatch directly to the renderer"

	self renderer doRender: aBlSpace
]

{ #category : #'host space - rendering' }
TTbHostSpace >> render: aBlSpace onFormSurface: aBlHostRendererFormSurface [
	"Render a given space on an a Form surface.
	By default dispatch directly to the renderer"

	self renderer doRender: aBlSpace
]

{ #category : #'host space - rendering' }
TTbHostSpace >> render: aBlSpace onOpenGLSurface: aBlHostRendererOpenGLSurface [
	"Render a given space on an OpenGL surface.
	By default dispatch directly to the renderer"

	self renderer doRender: aBlSpace
]

{ #category : #'host space - accessing' }
TTbHostSpace >> renderer [
	"Return host renderer used to render spaces"
	<return: #TBlHostRenderer>

	^ self explicitRequirement
]

{ #category : #'host space - accessing' }
TTbHostSpace >> scaleFactor [
	"Return a scaling factor from space to window coordinates.
	On high dpi (retina) displays scaling factor is > 1"
	<return: #Point>
	
	^ self explicitRequirement
]

{ #category : #'host space - displaying' }
TTbHostSpace >> show [
	self explicitRequirement
]

{ #category : #'host space - accessing' }
TTbHostSpace >> space [
	"Return a space I am assigned to"
	<return: #BlSpace>

	^ self explicitRequirement
]

{ #category : #'host space - accessing' }
TTbHostSpace >> space: aSpace [
	"Assign me to a given space"

	self explicitRequirement
]

{ #category : #'host space - testing' }
TTbHostSpace >> supportsBufferSurface [
	"Return true if this host space can work with a buffer surface, false otherwise"
	<return: #Boolean>

	^ self host supportsBufferSurface
]

{ #category : #'host space - testing' }
TTbHostSpace >> supportsFormSurface [
	"Return true if this host space can work with form surface, false otherwise"
	<return: #Boolean>
	
	^ self host supportsFormSurface
]

{ #category : #'host space - testing' }
TTbHostSpace >> supportsOpenGLSurface [
	"Return true if this host space can work with OpenGL surface, false otherwise"
	<return: #Boolean>
	
	^ self host supportsOpenGLSurface
]

{ #category : #'host space - displaying' }
TTbHostSpace >> toBack [
	self explicitRequirement
]

{ #category : #'host space - displaying' }
TTbHostSpace >> toFront [
	self explicitRequirement
]

{ #category : #'host space - accessing' }
TTbHostSpace >> windowExtent [
	"Return the window size in screen coordinates.
	This size may differ from the size in pixels of underlying surface 
	on high dpi (retina) screens"
	<return: #Point>

	^ self explicitRequirement
]

{ #category : #'host space - accessing' }
TTbHostSpace >> windowExtent: anExtent [
	self explicitRequirement
]
