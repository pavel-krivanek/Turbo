Class {
	#name : #TextBlocTestingHostSpace,
	#superclass : #Object,
	#traits : 'TBlHostSpace',
	#classTraits : 'TBlHostSpace classTrait',
	#instVars : [
		'displayMatrix',
		'host',
		'renderer',
		'space',
		'eventFetcher',
		'mutex'
	],
	#category : #'TextBloc-Core-Testing'
}

{ #category : #accessing }
TextBlocTestingHostSpace >> content [

	^ String streamContents: [ :s |
		displayMatrix do: [ :line | s nextPutAll: line; cr ] ]
]

{ #category : #initialization }
TextBlocTestingHostSpace >> createDisplayMatrix [

	displayMatrix := (1 to: space height) collect: [ :y |
		(1 to: space width) collect: [ :x | Character space ] ].


]

{ #category : #initialization }
TextBlocTestingHostSpace >> displayMatrix [

	^ displayMatrix
]

{ #category : #'as yet unclassified' }
TextBlocTestingHostSpace >> displaySurface: aSurface [

	displayMatrix := aSurface displayMatrix.
]

{ #category : #accessing }
TextBlocTestingHostSpace >> eventFetcher [
	"Return event fetcher used to enqueue events that should be
	processed in the beginning of every frame"
	<return: #BlHostEventFetcher>

	^ eventFetcher
]

{ #category : #'host space - accessing' }
TextBlocTestingHostSpace >> host [
	"Return a host that was used to create this host space"
	<return: #BlHost>

	^ host
]

{ #category : #'host space - accessing' }
TextBlocTestingHostSpace >> host: aBlHost [
	"Assign a host that was used to create this host space"
	
	host := aBlHost
]

{ #category : #initialization }
TextBlocTestingHostSpace >> initialize [
	super initialize.

	eventFetcher := BlHostEventFetcher new.
	mutex := Mutex new.
	

]

{ #category : #'host space - accessing' }
TextBlocTestingHostSpace >> lock [
	^ mutex
]

{ #category : #'instance creation' }
TextBlocTestingHostSpace >> newSurface [

	^ TextBlocRendererTestingSurface new
]

{ #category : #'host space - displaying' }
TextBlocTestingHostSpace >> open [
	self show
]

{ #category : #'host space - rendering' }
TextBlocTestingHostSpace >> prepareToRender: aBlSpace onFormSurface: aBlHostRendererFormSurface [
	"Prepare host space to a given space on a Form surface.
	By default dispatch directly to the renderer"

	self renderer prepareToRender: aBlSpace
]

{ #category : #'host space - rendering' }
TextBlocTestingHostSpace >> render: aSpace [
	"Render a given abstract space on an underlying window or visual area"

	self renderer render: aSpace.
	self displaySurface: self renderer surface.
	

]

{ #category : #'host space - accessing' }
TextBlocTestingHostSpace >> renderer [
	"Return host renderer used to render spaces"
	<return: #TBlHostRenderer>

	^ renderer
]

{ #category : #accessing }
TextBlocTestingHostSpace >> show [
	
	^ displayMatrix
]

{ #category : #'host space - accessing' }
TextBlocTestingHostSpace >> space [
	"Return a space I am assigned to"
	<return: #BlSpace>

	^ space
]

{ #category : #'host space - accessing' }
TextBlocTestingHostSpace >> space: aSpace [
	"Assign me to a given space"

	space := aSpace
]

{ #category : #'window - properties' }
TextBlocTestingHostSpace >> title [
	"Return window's title as a string"
	<return: #String>

	^ 'TextBloc'
]

{ #category : #'window - properties' }
TextBlocTestingHostSpace >> title: aString [
	"Change window's title"

	"ignore for now, TODO"
]

{ #category : #'host space - accessing' }
TextBlocTestingHostSpace >> windowExtent [
	"Return the window size in screen coordinates.
	This size may differ from the size in pixels of underlying surface 
	on high dpi (retina) screens"
	<return: #Point>

	^ 310@200 "TODO"
]

{ #category : #'host space - accessing' }
TextBlocTestingHostSpace >> windowExtent: anExtent [	
	
	
]

{ #category : #'as yet unclassified' }
TextBlocTestingHostSpace >> withTextBlocRenderer [

	renderer := TextBlocRenderer new.
	renderer initializeHostSpace: self.
]
