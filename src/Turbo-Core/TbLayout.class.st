"
I represent an abstract Bloc layout.

I define an api of a layout. Concrete implementations should focus on measure:with: and layout:in:

I am used by bloc elements.
"
Class {
	#name : 'TbLayout',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'requestingLayout',
		'previousMeasurementSpec',
		'direction',
		'waitingLayout'
	],
	#category : 'Turbo-Core-Layouts-Basic',
	#package : 'Turbo-Core',
	#tag : 'Layouts-Basic'
}

{ #category : 'constraints' }
TbLayout class >> constraints [
	^ self subclassResponsibility
]

{ #category : 'private - alignment' }
TbLayout >> align: anElement bounds: elementBounds in: theParentBounds with: aBlElementAlignment [
	"I don't additionally take element margin or parent padding"
	| aTranslation alignment |
	
	"a composite alignment"
	alignment := aBlElementAlignment directed: self direction.
	aTranslation := alignment translationOf: elementBounds in: theParentBounds.

	aTranslation x isZero
		ifTrue: [ aTranslation := theParentBounds left @ aTranslation y ].
	aTranslation y isZero
		ifTrue: [ aTranslation := aTranslation x @ theParentBounds top ].

	^ elementBounds translateBy: aTranslation
]

{ #category : 'api - alignment' }
TbLayout >> align: aChildElement horizontal: aBlAlignment [
	"I should be used to dispatch children alignment configuration through layout to provide higher level uniform alignment api.	
	Layouts that support children alignment should override me as follows:
	
	aChildElement constraintsDo: [ :c | (c at: self class) horizontal alignment: aBlAlignment ]

	"
]

{ #category : 'api - alignment' }
TbLayout >> align: aChildElement vertical: aBlAlignment [
	"I should be used to dispatch children alignment configuration through layout to provide higher level uniform alignment api.	
	Layouts that support children alignment should override me as follows:
	
	aChildElement constraintsDo: [ :c | (c at: self class) vertical alignment: aBlAlignment ]

	"
]

{ #category : 'initialization' }
TbLayout >> defaultDirection [
	<return: #BlLayoutDirection>

	^ TbLayoutDirection leftToRight
]

{ #category : 'direction' }
TbLayout >> direction [
	^ direction
]

{ #category : 'direction' }
TbLayout >> direction: aBlLayoutDirection [
	direction := aBlLayoutDirection
]

{ #category : 'geometry' }
TbLayout >> findClosestChildOf: anElement to: aPoint [
	"Find and return the closest direct child of a given element to a provided point in the coordinate system of anElement"
	<return: #BlElement>
	
	^ anElement children first
]

{ #category : 'initialization' }
TbLayout >> initialize [
	super initialize.
	
	requestingLayout := true.
	waitingLayout := true.
	direction := self defaultDirection
]

{ #category : 'enumeration' }
TbLayout >> layeredChildren: anElement [
	"Return a collecton of the anElement's children that should be layered out by the layout"
	
	^ Array streamContents: [ :aStream |
		self layeredChildren: anElement do: [ :aChild | aStream nextPut: aChild ] ]
]

{ #category : 'enumeration' }
TbLayout >> layeredChildren: anElement do: aBlock [
	"Evaluate a given block with all children of anElement
	that should be layered out within anElement.
	By default only children that are not ignored by layout are layered"
	
	anElement children
		select: [ :aChild | aChild constraints ignoredByLayout not ]
		thenDo: aBlock
]

{ #category : 'layout' }
TbLayout >> layout: anElement in: aRectangle [
]

{ #category : 'layout' }
TbLayout >> layoutIgnored: anElement [
	"Layout children ignored by layout so that their measured bounds
	become actual bounds in parent"
	| parentBounds |

	"when layering ignored childed we don't take parent padding into account"
	parentBounds := (0@0 extent: anElement extent).
	"reuse the same instance for children bounds"
	
	anElement children
		select: [ :aChild | aChild constraints ignoredByLayout ]
		thenDo: [ :aChild |
			| childBounds |
			"ask child for its measured bounds"
			childBounds := aChild measuredBounds bounds.
			"frame layout supports alignment, so we need to translate child's bounds accordingly to alignment"
			childBounds := self
				align: aChild
				bounds: (aChild margin expand: childBounds)
				in: parentBounds
				with: aChild constraints ignored alignment.
			"and finally set new bounds"
			aChild applyLayoutIn: (aChild margin inset: childBounds) ]
]

{ #category : 'direction' }
TbLayout >> leftToRight [
	direction := TbLayoutDirection leftToRight
]

{ #category : 'measure' }
TbLayout >> measure: anElement with: anExtentSpec [
	"Default simple and naive implementation that does not support #fitContent resizing
	strategy of the anElement that uses a layout with this version of measurement"

	anElement measuredExtent: (anExtentSpec sizeFor: 0@0).
	self measuredChildren: anElement do: [ :aChild |
		self
			measureChild: aChild
			parentSpec: anExtentSpec ]
]

{ #category : 'private - measurement' }
TbLayout >> measureChild: aChildElement parentSpec: anExtentSpec [
	"Measure a given child element allowing it to take as much space within parent
	as it want *does not* taking child's margin and parent's padding into account.
	Note: You are only allowed to use me in a context of BlLayout and not from outside"

	self
		measureChild: aChildElement
		parentSpec: anExtentSpec
		widthUsed: 0
		heightUsed: 0
]

{ #category : 'protected' }
TbLayout >> measureChild: anElement parentSpec: parentSpec widthUsed: widthUsed heightUsed: heightUsed [
	"Measure anElement based on provided parent's extent measurement specification and used width and height.
	used width and height can contain margin and/or padding.
	@see BlElement>>#measurementSpecFor:usedSize:resizing: for more info"

	anElement measure: (TbExtentMeasurementSpec new
		widthSpec: (self
			measurementSpecFor: parentSpec widthSpec
			usedSize: widthUsed
			resizer: anElement constraints horizontal resizer);
		heightSpec: (self
			measurementSpecFor: parentSpec heightSpec
			usedSize: heightUsed
			resizer: anElement constraints vertical resizer))
]

{ #category : 'protected' }
TbLayout >> measureChildWithMargins: anElement parentSpec: parentSpec [
	"Measure anElement based on provided parent's extent measurement specification
	taking element's margin and parent's padding into account"
	
	self
		measureChildWithMargins: anElement
		parentSpec: parentSpec
		widthUsed: 0
		heightUsed: 0
]

{ #category : 'protected' }
TbLayout >> measureChildWithMargins: anElement parentSpec: parentSpec widthUsed: widthUsed heightUsed: heightUsed [
	"Measure anElement based on provided parent's extent measurement specification and used width and height
	taking element's margin and parent's padding into account"
	
	self
		measureChild: anElement
		parentSpec: parentSpec
		widthUsed: anElement parent insets width + anElement outsets width + widthUsed
		heightUsed: anElement parent insets height + anElement outsets height + heightUsed
]

{ #category : 'private - measurement' }
TbLayout >> measureIgnored: anElement with: anExtentSpec [
	"Measure ignore children of a given parent allowing them to take as much space as they want"

	anElement children
		select: [ :aChild | aChild constraints ignoredByLayout ]
		thenDo: [ :aChild |
			| aWidthSpec aHeightSpec |
			
			aWidthSpec := anExtentSpec widthSpec.
			aHeightSpec := anExtentSpec heightSpec.

			aChild constraints horizontal resizer isMatchParent
				ifTrue: [ aWidthSpec := TbMeasurementSpec exact: (anElement measuredBounds width * aChild constraints ignored horizontal weight) ].
			
			aChild constraints vertical resizer isMatchParent
				ifTrue: [ aHeightSpec := TbMeasurementSpec exact: (anElement measuredBounds height * aChild constraints ignored vertical weight) ].
			
			self
				measureChild: aChild
				parentSpec: aWidthSpec @ aHeightSpec ]
]

{ #category : 'enumeration' }
TbLayout >> measuredChildren: anElement [
	"Return a collecton of the anElement's children that should be measures by the layout"
	
	^ Array streamContents: [ :aStream |
		self measuredChildren: anElement do: [ :aChild | aStream nextPut: aChild ] ]
]

{ #category : 'enumeration' }
TbLayout >> measuredChildren: anElement do: aBlock [
	"Evaluate a given block with all children of anElement
	that should be taken into account during measurement process.
	By default only children that are not ignored by layout are measured"
	
	anElement children
		select: [ :aChild | aChild constraints ignoredByLayout not ]
		thenDo: aBlock
]

{ #category : 'protected' }
TbLayout >> measurementSpecFor: parentSpec usedSize: usedSize resizer: childResizer [
	"I determinate what measurement specification my child should have
	based on parent's measurement spec and child's resizer property.
	
	parentSpec may have the following modes:
	 - At Most: parent's size can be at most as provided value 
	 - Exactly: parent's size equals provided value
	 - Unspecified: parent still has no idea how big it should be
	
	usedSize is a number describing how much child's size differs from parent one
		defined in parentSpec. usedSize can consist out of child's margin and/or
		parent's padding. Custom layouts may introduce more parameters that influence
		on final size of child.
	
	childResizer may be:
	 - Parent Match: meaning that child wants to be as big as parent is. It may also proportionally
	   depend on parent
	 - Wrap Content: child tries to be big enough to fit contained subnodes
	 - Exactly: child knows exactly how big it wants to be
	"
	<return: #BlMeasurementSpec>

	| size |
   size := 0 max: ((parentSpec size ifNil: [ 0 ]) - usedSize).
	^ parentSpec mode measurement: childResizer with: size
]

{ #category : 'hooks - layout' }
TbLayout >> onLayoutDone: anElement [
	"Is sent after layout is completely computed.
	All layout changes done within this hook will be performed during the next frame.
	Note: I am sent before the drawing process"
]

{ #category : 'private' }
TbLayout >> previousMeasurementSpec [
	^ previousMeasurementSpec
]

{ #category : 'private' }
TbLayout >> previousMeasurementSpec: anObject [
	previousMeasurementSpec := anObject
]

{ #category : 'protected' }
TbLayout >> requestingLayout [
	"Return true if element requested layout on next space pulse, false otherwise"
	<return: #Boolean>

	^ requestingLayout
]

{ #category : 'protected' }
TbLayout >> requestingLayout: aBoolean [
		
	aBoolean
		ifTrue: [ waitingLayout := true ]
		ifFalse: [ self waitingLayout
			ifTrue: [ ^ self ] ].

	requestingLayout := aBoolean
]

{ #category : 'direction' }
TbLayout >> rightToLeft [
	direction := TbLayoutDirection rightToLeft
]

{ #category : 'protected' }
TbLayout >> waitingLayout [
	"Return true if my owner element is still waiting for the start of layout pass, false otherwise"
	<return: #Boolean>

	^ waitingLayout
]

{ #category : 'protected' }
TbLayout >> waitingLayout: aBoolean [
	"Change my layout waiting state. If aBoolean is false it would mean that measurement and
	layout pass began, true means that I still have to wait"

	waitingLayout := aBoolean
]
