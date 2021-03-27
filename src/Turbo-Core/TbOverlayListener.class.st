"
I am an event listener that overlay element adds to the reference element in order to relocate and resize itself according to that element
"
Class {
	#name : #TbOverlayListener,
	#superclass : #TbElementEventListener,
	#instVars : [
		'overlayElement',
		'attachmentsCount'
	],
	#category : #'Turbo-Core-Utilities - Overlay'
}

{ #category : #'instance creation' }
TbOverlayListener class >> for: anOverlayElement [
	^ self basicNew
		initialize;
		overlayElement: anOverlayElement
]

{ #category : #'instance creation' }
TbOverlayListener class >> new [
	self error: 'Do not create an instance of ', self name, ' using new. Please use #for: instead'
]

{ #category : #'element handlers' }
TbOverlayListener >> elementExtentChanged: anEvent [
	self resizeTo: anEvent currentTarget
]

{ #category : #'element handlers' }
TbOverlayListener >> elementPositionInSpaceChanged: anEvent [
	self relocateTo: anEvent currentTarget
]

{ #category : #geometry }
TbOverlayListener >> extentFor: anElement [
	<return: #Point>

	^ (self overlayElement globalBoundsToLocal: anElement bounds inSpace bounds copy) extent
]

{ #category : #initialization }
TbOverlayListener >> initialize [
	super initialize.
	
	attachmentsCount := 0
]

{ #category : #'api - hooks' }
TbOverlayListener >> onInstalledIn: anElement [
	self
		assert: [ attachmentsCount isZero ]
		description: [ 'I must be attached to at most one element' ].
		
	attachmentsCount := attachmentsCount + 1.
	
	self relocateTo: anElement.
	self resizeTo: anElement
]

{ #category : #'api - hooks' }
TbOverlayListener >> onUninstalledIn: anObject [
	
	self
		assert: [ attachmentsCount = 1 ]
		description: [ 'I must be attached to at most one element' ].
	
	attachmentsCount := attachmentsCount - 1
]

{ #category : #accessing }
TbOverlayListener >> overlayElement [
	<return: #BlOverlayElement>

	^ overlayElement
]

{ #category : #accessing }
TbOverlayListener >> overlayElement: anOverlayElement [

	self
		assert: [ anOverlayElement isNotNil ]
		description: [ 'Overlay element must not be nil' ].

	overlayElement := anOverlayElement
]

{ #category : #geometry }
TbOverlayListener >> positionFor: anElement [
	<return: #Point>
	
	self
		assert: [ anElement isNotNil ]
		description: [ 'Reference element must not be nil' ].
	
	^ (self overlayElement globalPointToParent: anElement bounds inSpace position)
]

{ #category : #'api - updating' }
TbOverlayListener >> relocateTo: anElement [
	self overlayElement relocate: (self positionFor: anElement)
]

{ #category : #'api - updating' }
TbOverlayListener >> resizeTo: anElement [
	self overlayElement size: (self extentFor: anElement)
]
