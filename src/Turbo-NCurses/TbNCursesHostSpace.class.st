Class {
	#name : #TbNCursesHostSpace,
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
	#category : #'Turbo-NCurses'
}

{ #category : #accessing }
TbNCursesHostSpace >> eventFetcher [
	"Return event fetcher used to enqueue events that should be
	processed in the beginning of every frame"
	<return: #TbHostEventFetcher>

	^ eventFetcher
]

{ #category : #'host space - accessing' }
TbNCursesHostSpace >> host [
	"Return a host that was used to create this host space"
	<return: #BlHost>

	^ host
]

{ #category : #'host space - accessing' }
TbNCursesHostSpace >> host: aBlHost [
	"Assign a host that was used to create this host space"
	
	host := aBlHost
]

{ #category : #initialization }
TbNCursesHostSpace >> initialize [
	super initialize.

	eventFetcher := TbHostEventFetcher new.
	mutex := Mutex new.

]

{ #category : #'host space - accessing' }
TbNCursesHostSpace >> lock [
	^ mutex
]

{ #category : #'instance creation' }
TbNCursesHostSpace >> newSurface [

	^ TbRendererNCursesSurface new
]

{ #category : #'host space - displaying' }
TbNCursesHostSpace >> open [
	"self show"
]

{ #category : #'host space - rendering' }
TbNCursesHostSpace >> prepareToRender: aBlSpace onFormSurface: aBlHostRendererFormSurface [
	"Prepare host space to a given space on a Form surface.
	By default dispatch directly to the renderer"

	self renderer prepareToRender: aBlSpace
]

{ #category : #'host space - rendering' }
TbNCursesHostSpace >> render: aSpace [
	"Render a given abstract space on an underlying window or visual area"

	| aForm |
	self renderer render: aSpace.
	aForm := self renderer surface form.
"	morphicWindow spaceForm form copy: (0@0 extent: aForm extent) from: 0@0 in: aForm rule: Form over.
	morphicWindow spaceForm changed."
	

]

{ #category : #'host space - accessing' }
TbNCursesHostSpace >> renderer [
	"Return host renderer used to render spaces"
	<return: #TBlHostRenderer>

	^ renderer
]

{ #category : #accessing }
TbNCursesHostSpace >> show [
	"| anExtent |
	
	anExtent := morphicWindow extent.
	morphicWindow openInWorld.
	morphicWindow extent: anExtent"
]

{ #category : #'host space - accessing' }
TbNCursesHostSpace >> space [
	"Return a space I am assigned to"
	<return: #TbSpace>

	^ space
]

{ #category : #'host space - accessing' }
TbNCursesHostSpace >> space: aSpace [
	"Assign me to a given space"

	space := aSpace
]

{ #category : #'window - properties' }
TbNCursesHostSpace >> title [
	"Return window's title as a string"
	<return: #String>

	^ 'Turbo'
]

{ #category : #'window - properties' }
TbNCursesHostSpace >> title: aString [
	"Change window's title"

	"ignore for now, TODO"
]

{ #category : #'host space - accessing' }
TbNCursesHostSpace >> windowExtent [
	"Return the window size in screen coordinates.
	This size may differ from the size in pixels of underlying surface 
	on high dpi (retina) screens"
	<return: #Point>

	^ 80@25
]

{ #category : #'host space - accessing' }
TbNCursesHostSpace >> windowExtent: anExtent [

	
]

{ #category : #'as yet unclassified' }
TbNCursesHostSpace >> withTurboRenderer [

	renderer := TbRenderer new.
	renderer initializeHostSpace: self.
]
