Class {
	#name : #TextBlocVTEHostSpace,
	#superclass : #Object,
	#traits : 'TBlHostSpace',
	#classTraits : 'TBlHostSpace classTrait',
	#instVars : [
		'host',
		'renderer',
		'space',
		'eventFetcher',
		'mutex'
	],
	#category : #'TextBloc-VTE'
}

{ #category : #accessing }
TextBlocVTEHostSpace >> eventFetcher [
	"Return event fetcher used to enqueue events that should be
	processed in the beginning of every frame"
	<return: #BlHostEventFetcher>

	^ eventFetcher
]

{ #category : #'host space - accessing' }
TextBlocVTEHostSpace >> host [
	"Return a host that was used to create this host space"
	<return: #BlHost>

	^ host
]

{ #category : #'host space - accessing' }
TextBlocVTEHostSpace >> host: aBlHost [
	"Assign a host that was used to create this host space"
	
	host := aBlHost
]

{ #category : #initialization }
TextBlocVTEHostSpace >> initialize [
	super initialize.

	eventFetcher := BlHostEventFetcher new.
	mutex := Mutex new.

]

{ #category : #'host space - accessing' }
TextBlocVTEHostSpace >> lock [
	^ mutex
]

{ #category : #'instance creation' }
TextBlocVTEHostSpace >> newSurface [

	^ TextBlocRendererVTESurface new
]

{ #category : #'host space - displaying' }
TextBlocVTEHostSpace >> open [
	"self show"
]

{ #category : #'host space - rendering' }
TextBlocVTEHostSpace >> prepareToRender: aBlSpace onFormSurface: aBlHostRendererFormSurface [
	"Prepare host space to a given space on a Form surface.
	By default dispatch directly to the renderer"

	self renderer prepareToRender: aBlSpace
]

{ #category : #'host space - rendering' }
TextBlocVTEHostSpace >> render: aSpace [
	"Render a given abstract space on an underlying window or visual area"

	| aForm |
	self renderer render: aSpace.
	aForm := self renderer surface form.
"	morphicWindow spaceForm form copy: (0@0 extent: aForm extent) from: 0@0 in: aForm rule: Form over.
	morphicWindow spaceForm changed."
	

]

{ #category : #'host space - accessing' }
TextBlocVTEHostSpace >> renderer [
	"Return host renderer used to render spaces"
	<return: #TBlHostRenderer>

	^ renderer
]

{ #category : #accessing }
TextBlocVTEHostSpace >> show [
	"| anExtent |
	
	anExtent := morphicWindow extent.
	morphicWindow openInWorld.
	morphicWindow extent: anExtent"
]

{ #category : #'host space - accessing' }
TextBlocVTEHostSpace >> space [
	"Return a space I am assigned to"
	<return: #BlSpace>

	^ space
]

{ #category : #'host space - accessing' }
TextBlocVTEHostSpace >> space: aSpace [
	"Assign me to a given space"

	space := aSpace
]

{ #category : #'window - properties' }
TextBlocVTEHostSpace >> title [
	"Return window's title as a string"
	<return: #String>

	^ 'TextBloc'
]

{ #category : #'window - properties' }
TextBlocVTEHostSpace >> title: aString [
	"Change window's title"

	"ignore for now, TODO"
]

{ #category : #'host space - accessing' }
TextBlocVTEHostSpace >> windowExtent [
	"Return the window size in screen coordinates.
	This size may differ from the size in pixels of underlying surface 
	on high dpi (retina) screens"
	<return: #Point>

	^ 80@25
]

{ #category : #'host space - accessing' }
TextBlocVTEHostSpace >> windowExtent: anExtent [

	
]

{ #category : #'as yet unclassified' }
TextBlocVTEHostSpace >> withTextBlocRenderer [

	renderer := TextBlocRenderer new.
	renderer initializeHostSpace: self.
]
