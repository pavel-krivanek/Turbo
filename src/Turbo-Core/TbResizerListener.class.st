"
I am an abstract listener associated with a specific resizer element (e.g., bottom right). My subclasses define the specific behavior.

An element with applied Resizer Listener sends ==BlResizerResizedEvent== after the resizing target was resized
"
Class {
	#name : #TbResizerListener,
	#superclass : #TbElementEventListener,
	#instVars : [
		'dragStartPosition',
		'originalPosition',
		'resizeTarget',
		'originalExtent',
		'minimumExtent'
	],
	#category : #'Turbo-Core-Utilities - Resizable'
}

{ #category : #'dnd handlers' }
TbResizerListener >> dragEndEvent: anEvent [
	anEvent consumed: true
]

{ #category : #'dnd handlers' }
TbResizerListener >> dragEvent: anEvent [
	<event: #BlResizerResizedEvent>
	| dragPosition dragDelta theBounds theOriginalBounds widthChanged heightChanged |

	anEvent consumed: true.
	
	self hasTarget
		ifFalse: [ ^ self ].

	dragPosition := anEvent position.
	dragDelta := dragPosition - dragStartPosition.

	theBounds := BlBounds origin: originalPosition extent: originalExtent.
	theOriginalBounds := theBounds copy.

	self
		resizeBounds: theBounds
		by: dragDelta.
	
	widthChanged := theBounds width ~= theOriginalBounds width.
	heightChanged := theBounds height ~= theOriginalBounds height.
	
	self resizeTarget globalBoundsToLocal: theBounds.
	self resizeTarget localBoundsToParent: theBounds.

	self resizeTarget relocate: theBounds position.
	
	(widthChanged or: [ heightChanged ])
		ifFalse: [ ^ self ].

	widthChanged
		ifTrue: [ self resizeTarget width: theBounds width ].

	heightChanged
		ifTrue: [ self resizeTarget height: theBounds height ].
	
	anEvent currentTarget dispatchEvent: (BlResizerResizedEvent new extent: theBounds extent)
]

{ #category : #'dnd handlers' }
TbResizerListener >> dragStartEvent: anEvent [
	anEvent consumed: true.

	"drag start position in parent"
	dragStartPosition := anEvent position.

	self hasTarget
		ifFalse: [ ^ self ].

	"element's original extent"
	originalExtent := self resizeTarget bounds inSpace extent.
	originalPosition := self resizeTarget bounds inSpace position
]

{ #category : #testing }
TbResizerListener >> hasTarget [
	^ resizeTarget isNotNil
]

{ #category : #initialization }
TbResizerListener >> initialize [
	super initialize.

	minimumExtent := 5 asPoint
]

{ #category : #resizer }
TbResizerListener >> minimumExtent [
	<return: #Point>

	^ minimumExtent
]

{ #category : #resizer }
TbResizerListener >> minimumExtent: aPoint [
	minimumExtent := aPoint
]

{ #category : #'mouse handlers' }
TbResizerListener >> mouseDownEvent: anEvent [
	anEvent consumed: true
]

{ #category : #'mouse handlers' }
TbResizerListener >> mouseEnterEvent: anEvent [
	anEvent currentTarget mouseCursor: self resizerCursor
]

{ #category : #'mouse handlers' }
TbResizerListener >> mouseLeaveEvent: anEvent [
	anEvent currentTarget mouseCursor: nil
]

{ #category : #resizer }
TbResizerListener >> resizeBounds: aBlBounds by: aPoint [
	self subclassResponsibility
]

{ #category : #accessing }
TbResizerListener >> resizeTarget [
	^ resizeTarget
]

{ #category : #accessing }
TbResizerListener >> resizeTarget: anObject [
	resizeTarget := anObject
]

{ #category : #resizer }
TbResizerListener >> resizeTargetBy: aDelta [
	(aDelta isZero not)
		ifTrue: [ ^ self resizeTarget size: aDelta ].

	aDelta x isZero
		ifTrue: [ ^ self resizeTarget width: aDelta x ].
		
	aDelta y isZero
		ifTrue: [ ^ self resizeTarget height: aDelta x isZero ]
]

{ #category : #resizer }
TbResizerListener >> resizerCursor [
	<return: #Form>

	^ self subclassResponsibility
]
