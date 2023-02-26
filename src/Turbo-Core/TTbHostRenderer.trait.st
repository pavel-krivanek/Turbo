"
I define the public API that host renderers must provide.
"
Trait {
	#name : #TTbHostRenderer,
	#category : #'Turbo-Core-Universe'
}

{ #category : #'renderer - rendering' }
TTbHostRenderer >> doRender: aSpace [
	self explicitRequirement
]

{ #category : #'renderer - rendering' }
TTbHostRenderer >> finishedRender: aSpace [
	"Perform neccessary actions after rendering is complete.
	By default I clear dirty areas of a given space"

	aSpace clearDirtyAreas
]

{ #category : #'renderer - testing' }
TTbHostRenderer >> hasResized [
	"Return true if host space resized since previous frame, otherwise false"
	<return: #Boolean>
	
	^ self explicitRequirement
]

{ #category : #initialization }
TTbHostRenderer >> initializeForBuffer: aBufferSurface [
	"Asks renderer to initialize itself to be used together with a pixel buffer surface"

	self explicitRequirement
]

{ #category : #initialization }
TTbHostRenderer >> initializeForForm: aFormSurface [
	"Asks renderer to initialize itself to be used together with a form surface"

	self explicitRequirement
]

{ #category : #initialization }
TTbHostRenderer >> initializeForOpenGL: anOpenGLSurface [
	"Asks renderer to initialize itself to be used together with an OpenGL surface"

	self explicitRequirement
]

{ #category : #initialization }
TTbHostRenderer >> initializeHostSpace: aBlHostSpace [
	self explicitRequirement
]

{ #category : #'renderer - rendering' }
TTbHostRenderer >> prepareToRender: aSpace [
	self explicitRequirement
]

{ #category : #'renderer - rendering' }
TTbHostRenderer >> presentAreas: aCollection [
	self surface presentAreas: aCollection
]

{ #category : #'renderer - rendering' }
TTbHostRenderer >> render: aSpace [
	"Render a given space according to its dirty areas.
	Note: if there are no dirty areas nothing will happen, including window or canvas update"
	
	(self renderNeeded: aSpace)
		ifFalse: [ ^ self ].

	self surface prepareToRender: aSpace.
	 [ self surface renderFor: aSpace ]
		ensure: [ self finishedRender: aSpace ]
]

{ #category : #'renderer - testing' }
TTbHostRenderer >> renderNeeded: aSpace [
	"Return true if I need to render a given space.
	By default I check if there are any dirty areas, if there are none - no need to render"
	<return: #Boolean>

	^ aSpace dirtyAreas notEmpty
]

{ #category : #'renderer - testing' }
TTbHostRenderer >> supportsBufferSurface [
	"Return true if this renderer can work with buffer surface, false otherwise"
	<return: #Boolean>
	
	^ self explicitRequirement
]

{ #category : #'renderer - testing' }
TTbHostRenderer >> supportsFormSurface [
	"Return true if this renderer can work with form surface, false otherwise"
	<return: #Boolean>
	
	^ self explicitRequirement
]

{ #category : #'renderer - testing' }
TTbHostRenderer >> supportsOpenGLSurface [
	"Return true if this renderer can work with OpenGL surface, false otherwise"
	<return: #Boolean>
	
	^ self explicitRequirement
]

{ #category : #'renderer - accessing' }
TTbHostRenderer >> surface [
	^ self explicitRequirement
]

{ #category : #'renderer - accessing' }
TTbHostRenderer >> surface: aRendererSurface [
	self explicitRequirement
]
