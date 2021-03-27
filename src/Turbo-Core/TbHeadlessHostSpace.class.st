"
I am a fallback host space that is chosen if there are no other available and supported hosts.
"
Class {
	#name : #TbHeadlessHostSpace,
	#superclass : #Object,
	#traits : 'TTbHostSpace + TTbDebug',
	#classTraits : 'TTbHostSpace classTrait + TTbDebug classTrait',
	#instVars : [
		'eventFetcher',
		'host',
		'space',
		'position',
		'title'
	],
	#category : #'Turbo-Core-Universe'
}

{ #category : #'window - properties' }
TbHeadlessHostSpace >> borderless [
	"Return true if underlying window is now borderless, false otherwise"
	<return: #Boolean>
	
	^ false
]

{ #category : #'window - properties' }
TbHeadlessHostSpace >> borderless: aBoolean [
	"Make host window borderless if true is given"
]

{ #category : #'host space - accessing' }
TbHeadlessHostSpace >> canvasExtent [
	"Return a window canvas size in user coordinates.
	This size may differ from the window size on high dpi (retina) screens.
	In most cases canvas is x2 larger than window in pixel on retina screens."
	<return: #Point>

	^ 0@0
]

{ #category : #'host space - displaying' }
TbHeadlessHostSpace >> close [
	"do nothing"
]

{ #category : #'host space - cursor' }
TbHeadlessHostSpace >> cursor: aCursor [
	"Change current cursor image/view to the given one"
]

{ #category : #'host space - accessing' }
TbHeadlessHostSpace >> densityDpi [
	"Return the screen density expressed as dots-per-inch"
	<return: #Number>
	
	^ 96.0
]

{ #category : #'host space - events' }
TbHeadlessHostSpace >> eventFetcher [
	"Return event fetcher used to enqueue events that should be
	processed in the beginning of every frame"
	<return: #TbHostEventFetcher>

	^ eventFetcher
]

{ #category : #'window - properties' }
TbHeadlessHostSpace >> fullscreen [
	"Return true if an underlying window is in fullscreen mode,
	false otherwise"
	<return: #Boolean>

	^ false
]

{ #category : #'window - properties' }
TbHeadlessHostSpace >> fullscreen: aBoolean [
	"Switch underlying window to fullscreen if true is given
	and exit fullscreen mode if false is given"
]

{ #category : #'host space - displaying' }
TbHeadlessHostSpace >> hide [
	"do nothing"
]

{ #category : #'host space - accessing' }
TbHeadlessHostSpace >> host [
	"Return a host that was used to create this host space"
	<return: #BlHost>

	^ host
]

{ #category : #'host space - accessing' }
TbHeadlessHostSpace >> host: aBlHost [
	"Assign a host that was used to create this host space"
	
	host := aBlHost
]

{ #category : #'window - properties' }
TbHeadlessHostSpace >> icon: aForm [
	"Change window's icon to the given one"
]

{ #category : #initialization }
TbHeadlessHostSpace >> initialize [
	super initialize.
	
	eventFetcher := TbHostEventFetcher new
]

{ #category : #'host space - testing' }
TbHeadlessHostSpace >> isVisible [
	"Return true if underlying window is shown, false otherwise.
	Note: If window was shown and then minimized it is still considered to be visible.
	Window can become invisible by asking it to hide"
	<return: #Boolean>

	^ false
]

{ #category : #'host space - displaying' }
TbHeadlessHostSpace >> maximize [
	"do nothing"
]

{ #category : #'host space - displaying' }
TbHeadlessHostSpace >> maximized [

	^ false
]

{ #category : #'host space - displaying' }
TbHeadlessHostSpace >> minimize [
	"do nothing"
]

{ #category : #'host space - displaying' }
TbHeadlessHostSpace >> minimized [

	^ false
]

{ #category : #'host space - displaying' }
TbHeadlessHostSpace >> open [
	"do nothing"
]

{ #category : #'window - properties' }
TbHeadlessHostSpace >> position [
	"Return window's position in screen coordinates"
	<return: #Point>
	
	^ position
]

{ #category : #'window - properties' }
TbHeadlessHostSpace >> position: aPoint [
	"Change window's position to a given point in screen coordinates"
	
	position := aPoint

]

{ #category : #'host space - drawing' }
TbHeadlessHostSpace >> render: aSpace [
	"Render a given abstract space on an underlying window or visual area"
]

{ #category : #'host space - accessing' }
TbHeadlessHostSpace >> renderer [
	"Return host renderer used to render spaces"
	<return: #TBlHostRenderer>

	^ self shouldNotImplement
]

{ #category : #'window - properties' }
TbHeadlessHostSpace >> resizable [
	"Return true if underlying window is resizable, false otherwise"
	<return: #Boolean>

	^ true
]

{ #category : #'window - properties' }
TbHeadlessHostSpace >> resizable: aBoolean [
	"Make underlying window resizable if true is given"
]

{ #category : #'host space - accessing' }
TbHeadlessHostSpace >> scaleFactor [
	"Return a scaling factor from space to window coordinates.
	On high dpi (retina) displays scaling factor is > 1"
	<return: #Point>
	
	^ 1.0 asPoint
]

{ #category : #'host space - displaying' }
TbHeadlessHostSpace >> show [
]

{ #category : #'host space - accessing' }
TbHeadlessHostSpace >> space [
	"Return a space I am assigned to"
	<return: #TbSpace>

	^ space
]

{ #category : #'host space - accessing' }
TbHeadlessHostSpace >> space: aSpace [
	"Assign me to a given space"

	space := aSpace
]

{ #category : #'window - properties' }
TbHeadlessHostSpace >> title [
	"Return window's title as a string"
	<return: #String>

	^ title
]

{ #category : #'window - properties' }
TbHeadlessHostSpace >> title: aString [
	"Change window's title"

	title := aString
]

{ #category : #'host space - displaying' }
TbHeadlessHostSpace >> toBack [
	"do nothing"
]

{ #category : #'host space - displaying' }
TbHeadlessHostSpace >> toFront [
	"do nothing"
]

{ #category : #'host space - accessing' }
TbHeadlessHostSpace >> windowExtent [
	"Return the window size in screen coordinates.
	This size may differ from the size in pixels of underlying surface 
	on high dpi (retina) screens"
	<return: #Point>

	^ 0@0
]

{ #category : #'host space - accessing' }
TbHeadlessHostSpace >> windowExtent: anExtent [
	
]
