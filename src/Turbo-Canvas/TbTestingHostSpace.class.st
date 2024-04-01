Class {
	#name : #TbTestingHostSpace,
	#superclass : #Object,
	#traits : 'TTbHostSpace',
	#classTraits : 'TTbHostSpace classTrait',
	#instVars : [
		'displayMatrix',
		'host',
		'renderer',
		'space',
		'eventFetcher',
		'mutex',
		'windowExtent'
	],
	#category : #'Turbo-Canvas-Testing'
}

{ #category : #accessing }
TbTestingHostSpace >> content [

	^ String streamContents: [ :s |
		displayMatrix do: [ :line | s nextPutAll: line; cr ] ]
]

{ #category : #initialization }
TbTestingHostSpace >> createDisplayMatrix [

	displayMatrix := (1 to: space height) collect: [ :y |
		(1 to: space width) collect: [ :x | Character space ] ].


]

{ #category : #initialization }
TbTestingHostSpace >> displayMatrix [

	^ displayMatrix
]

{ #category : #'as yet unclassified' }
TbTestingHostSpace >> displaySurface: aSurface [

	displayMatrix := aSurface displayMatrix.
]

{ #category : #accessing }
TbTestingHostSpace >> eventFetcher [
	"Return event fetcher used to enqueue events that should be
	processed in the beginning of every frame"
	<return: #TbHostEventFetcher>

	^ eventFetcher
]

{ #category : #'host space - accessing' }
TbTestingHostSpace >> host [
	"Return a host that was used to create this host space"
	<return: #BlHost>

	^ host
]

{ #category : #'host space - accessing' }
TbTestingHostSpace >> host: aBlHost [
	"Assign a host that was used to create this host space"
	
	host := aBlHost
]

{ #category : #initialization }
TbTestingHostSpace >> initialize [
	super initialize.

	eventFetcher := TbHostEventFetcher new.
	mutex := Mutex new.
	

]

{ #category : #'host space - accessing' }
TbTestingHostSpace >> lock [
	^ mutex
]

{ #category : #'instance creation' }
TbTestingHostSpace >> newSurface [

	^ TbRendererTestingSurface new
]

{ #category : #'host space - displaying' }
TbTestingHostSpace >> open [
	self show
]

{ #category : #'host space - rendering' }
TbTestingHostSpace >> prepareToRender: aBlSpace onFormSurface: aBlHostRendererFormSurface [
	"Prepare host space to a given space on a Form surface.
	By default dispatch directly to the renderer"

	self renderer prepareToRender: aBlSpace
]

{ #category : #'host space - rendering' }
TbTestingHostSpace >> render: aSpace [
	"Render a given abstract space on an underlying window or visual area"

	self renderer render: aSpace.
	self displaySurface: self renderer surface.
	

]

{ #category : #'host space - accessing' }
TbTestingHostSpace >> renderer [
	"Return host renderer used to render spaces"
	<return: #TBlHostRenderer>

	^ renderer
]

{ #category : #accessing }
TbTestingHostSpace >> show [
	
	^ displayMatrix
]

{ #category : #'host space - accessing' }
TbTestingHostSpace >> space [
	"Return a space I am assigned to"
	<return: #TbSpace>

	^ space
]

{ #category : #'host space - accessing' }
TbTestingHostSpace >> space: aSpace [
	"Assign me to a given space"

	space := aSpace
]

{ #category : #'window - properties' }
TbTestingHostSpace >> title [
	"Return window's title as a string"
	<return: #String>

	^ 'Turbo'
]

{ #category : #'window - properties' }
TbTestingHostSpace >> title: aString [
	"Change window's title"

	"ignore for now, TODO"
]

{ #category : #'host space - accessing' }
TbTestingHostSpace >> windowExtent [
	"Return the window size in screen coordinates.
	This size may differ from the size in pixels of underlying surface 
	on high dpi (retina) screens"
	<return: #Point>

	^ windowExtent ifNil: [ 310@200 ]
]

{ #category : #'host space - accessing' }
TbTestingHostSpace >> windowExtent: anExtent [	
	
	windowExtent := anExtent
	
]

{ #category : #'as yet unclassified' }
TbTestingHostSpace >> withTurboRenderer [

	renderer := TbRenderer new.
	renderer initializeHostSpace: self.
]
