"
I am a helper class intended to help developer implement drag-based selection.

May be used to implement text selection or desktop like selection behaviour
"
Class {
	#name : 'TbSelectionHandler',
	#superclass : 'TbElementEventListener',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'origin',
		'corner',
		'area',
		'container',
		'selected'
	],
	#category : 'Turbo-Core-Utilities - Selection',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Selection'
}

{ #category : 'geometry' }
TbSelectionHandler >> computeSelectionArea [
	area origin: (origin min: corner) corner: (corner max: origin)
]

{ #category : 'dnd handlers' }
TbSelectionHandler >> dragEndEvent: anEvent [
	super dragEndEvent: anEvent.
	
	anEvent consumed: true.
		
	origin := nil.
	corner := nil.
	area left: 0 top: 0 right: 0 bottom: 0
]

{ #category : 'dnd handlers' }
TbSelectionHandler >> dragEvent: anEvent [	
	"For selection we want to handle only those drag events that began exactly
	on the elemen I attached to"
		
	self hasOrigin
		ifFalse: [ ^ super dragOverEvent: anEvent ].
	
	anEvent consumed: true.
	
	corner := anEvent position.	
	self computeSelectionArea.
		
	self selectionChanged
]

{ #category : 'dnd handlers' }
TbSelectionHandler >> dragStartEvent: anEvent [
	anEvent consumed: true.

	origin := anEvent position
]

{ #category : 'selection - handling' }
TbSelectionHandler >> handleDeselected: anElement [
	| anEvent |
	
	anEvent := TbElementSelectionLostEvent new.
	anEvent target: anElement.
	anElement dispatchEvent: anEvent
]

{ #category : 'selection - handling' }
TbSelectionHandler >> handleSelected: anElement in: anIntersection [
	| anEvent |

	"we should make sure that we don't destroy existing BlBounds by performing destructive operation"
	self
		assert: [ anIntersection ~~ self selectionArea  ]
		description: [ 'Intersection must be a different bounds object than selection area' ].
	
	anEvent := TbElementSelectionAcquiredEvent new.
	anEvent bounds: anIntersection encompass.
	anEvent target: anElement.
	anElement dispatchEvent: anEvent.

	^ anEvent isConsumed
]

{ #category : 'testing' }
TbSelectionHandler >> hasOrigin [
	"Return true if I know selection origin position, false otherwise"
	<return: #Boolean>

	^ origin isNotNil
]

{ #category : 'initialization' }
TbSelectionHandler >> initialize [
	super initialize.
	
	area := TbBounds new.
	selected := IdentityDictionary new
]

{ #category : 'selection' }
TbSelectionHandler >> intersect: aChildElement in: aSelectionBounds ifNone: aNoneBlock [
	"Return selection intersection bounds of a given element and provided
	selection bounds in local child cordinates if intersection exists
	or evaluate a none block otherwise.
	Note: you should override me to modify selection area detection, for example
	for the case of text selection intersection is not just plain intersection"
	<return: #BlBounds>

	^ aSelectionBounds
		intersect: aChildElement boundsInLocal
		ifNone: aNoneBlock
]

{ #category : 'installation' }
TbSelectionHandler >> onInstalledIn: anElement [
	super onInstalledIn: anElement.
	
	container := anElement
]

{ #category : 'selection' }
TbSelectionHandler >> selectedChildren: anElement in: aBlBounds do: aBlock [
	"Evaluate a block with all children of an element that intersect with provided bounds.
	aBlBounds is given in local coordinates of anElement"	

	((self shouldSelect: anElement in: aBlBounds)
		and: [ (aBlock value: anElement value: aBlBounds) not ])
			ifFalse: [ ^ self ].
		
	anElement childrenDo: [ :aChild |	
		| boundsInLocal |
		boundsInLocal := aChild parentBoundsToLocal: aBlBounds copy.
		self
			selectedChildren: aChild
			in: boundsInLocal
			do: aBlock ]
]

{ #category : 'geometry' }
TbSelectionHandler >> selectionArea [
	"Return bounds representing a selection area in global coordinates"
	<return: #BlBounds>
	self
		assert: [ origin isNotNil and: [ corner isNotNil ] ]
		description: [ 'Selection origin and corner must be known' ].

	^ area
]

{ #category : 'selection - handling' }
TbSelectionHandler >> selectionChanged [
	"Is sent when #selectionArea changed"
	| oldSelected |

	oldSelected := selected copy.
	selected removeAll.

	self
		selectedChildren: container
		in: (container globalBoundsToLocal: self selectionArea copy)
		do: [ :anElement :aSelectionInLocal |
			| anIntersectionInLocal isSelectionChanged |

			anIntersectionInLocal := self
				intersect: anElement
				in: aSelectionInLocal
				ifNone: [ self error: 'Selected child must intersect with selection' ].
			
			oldSelected
				at: anElement
				ifPresent: [ :anExistingIntersection | isSelectionChanged := anExistingIntersection ~= anIntersectionInLocal ]
				ifAbsent: [ isSelectionChanged := true ].
	
			selected
				at: anElement
				put: anIntersectionInLocal.

			oldSelected removeKey: anElement ifAbsent: [].

			"return true / false if selection event was consumed (handled)"
			isSelectionChanged
				ifTrue: [ self handleSelected: anElement in: anIntersectionInLocal ]
				ifFalse: [ false ] ].
	
	oldSelected keysDo: [ :anElement | self handleDeselected: anElement ]
]

{ #category : 'selection' }
TbSelectionHandler >> shouldSelect: aChildElement in: aSelectionBounds [
	"Return true if a child element should be selected taking into account
	provided selection area bounds given int local coordinates of a child element"
	<return: #Boolean>
	
	^ (self
		intersect: aChildElement
		in: aSelectionBounds
		ifNone: [ nil ]) isNotNil
]
