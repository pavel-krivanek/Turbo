Class {
	#name : #TbTerminalHostSpace,
	#superclass : #Object,
	#traits : 'TTbHostSpace',
	#classTraits : 'TTbHostSpace classTrait',
	#instVars : [
		'host',
		'renderer',
		'space',
		'eventFetcher',
		'mutex'
	],
	#category : #'Turbo-Terminal'
}

{ #category : #accessing }
TbTerminalHostSpace >> eventFetcher [
	"Return event fetcher used to enqueue events that should be
	processed in the beginning of every frame"
	<return: #TbHostEventFetcher>

	^ eventFetcher
]

{ #category : #'host space - accessing' }
TbTerminalHostSpace >> host [
	"Return a host that was used to create this host space"
	<return: #BlHost>

	^ host
]

{ #category : #'host space - accessing' }
TbTerminalHostSpace >> host: aBlHost [
	"Assign a host that was used to create this host space"
	
	host := aBlHost
]

{ #category : #initialization }
TbTerminalHostSpace >> initialize [
	super initialize.

	eventFetcher := TbHostEventFetcher new.
	mutex := Mutex new.

]

{ #category : #'host space - accessing' }
TbTerminalHostSpace >> lock [
	^ mutex
]

{ #category : #'instance creation' }
TbTerminalHostSpace >> newSurface [

	^ TextBlocRendererTerminalSurface new
]

{ #category : #'host space - displaying' }
TbTerminalHostSpace >> open [
	"self show"
]

{ #category : #'host space - rendering' }
TbTerminalHostSpace >> prepareToRender: aBlSpace onFormSurface: aBlHostRendererFormSurface [
	"Prepare host space to a given space on a Form surface.
	By default dispatch directly to the renderer"

	self renderer prepareToRender: aBlSpace
]

{ #category : #'host space - rendering' }
TbTerminalHostSpace >> render: aSpace [
	"Render a given abstract space on an underlying window or visual area"

	| aForm |
	self renderer render: aSpace.
	aForm := self renderer surface form.
"	morphicWindow spaceForm form copy: (0@0 extent: aForm extent) from: 0@0 in: aForm rule: Form over.
	morphicWindow spaceForm changed."
	

]

{ #category : #'host space - accessing' }
TbTerminalHostSpace >> renderer [
	"Return host renderer used to render spaces"
	<return: #TBlHostRenderer>

	^ renderer
]

{ #category : #accessing }
TbTerminalHostSpace >> show [
	"| anExtent |
	
	anExtent := morphicWindow extent.
	morphicWindow openInWorld.
	morphicWindow extent: anExtent"
]

{ #category : #'host space - accessing' }
TbTerminalHostSpace >> space [
	"Return a space I am assigned to"
	<return: #BlSpace>

	^ space
]

{ #category : #'host space - accessing' }
TbTerminalHostSpace >> space: aSpace [
	"Assign me to a given space"

	space := aSpace
]

{ #category : #'window - properties' }
TbTerminalHostSpace >> title [
	"Return window's title as a string"
	<return: #String>

	^ 'TextBloc'
]

{ #category : #'window - properties' }
TbTerminalHostSpace >> title: aString [
	"Change window's title"

	"ignore for now, TODO"
]

{ #category : #'host space - accessing' }
TbTerminalHostSpace >> windowExtent [
	"Return the window size in screen coordinates.
	This size may differ from the size in pixels of underlying surface 
	on high dpi (retina) screens"
	<return: #Point>

	^ 80@25
]

{ #category : #'host space - accessing' }
TbTerminalHostSpace >> windowExtent: anExtent [

	
]

{ #category : #'as yet unclassified' }
TbTerminalHostSpace >> withTextBlocRenderer [

	renderer := TextBlocRenderer new.
	renderer initializeHostSpace: self.
]
