Class {
	#name : #TbSpaceEventListener,
	#superclass : #TbEventListener,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'space',
		'mouseDragListener',
		'dragCollectionElement'
	],
	#category : #'Turbo-Core-Space-Support'
}

{ #category : #'as yet unclassified' }
TbSpaceEventListener class >> space: aStage [
	^ self new
		space: aStage;
		yourself
]

{ #category : #accessing }
TbSpaceEventListener >> focusProcessor [
	^ self space focusProcessor
]

{ #category : #accessing }
TbSpaceEventListener >> gestureProcessor [
	^ self space gestureProcessor
]

{ #category : #'gesture handlers' }
TbSpaceEventListener >> gestureScrollEvent: anEvent [
	self gestureProcessor handleGesture: anEvent
]

{ #category : #'other handlers' }
TbSpaceEventListener >> inputMethodEvent: anEvent [
]

{ #category : #'keyboard handlers' }
TbSpaceEventListener >> keyDownEvent: anEvent [
	self keyboardProcessor processKeyDown: anEvent
]

{ #category : #'keyboard handlers' }
TbSpaceEventListener >> keyUpEvent: anEvent [
	self keyboardProcessor processKeyUp: anEvent
]

{ #category : #accessing }
TbSpaceEventListener >> keyboardProcessor [
	^ self space keyboardProcessor
]

{ #category : #'keyboard handlers' }
TbSpaceEventListener >> keystrokeEvent: anEvent [
	self keyboardProcessor processKeystroke: anEvent
]

{ #category : #'other handlers' }
TbSpaceEventListener >> menuEvent: anEvent [
]

{ #category : #'mouse handlers' }
TbSpaceEventListener >> mouseDownEvent: anEvent [
	self mouseProcessor handleMouseDown: anEvent.
	self focusProcessor handleMouseDown: anEvent
]

{ #category : #'other handlers' }
TbSpaceEventListener >> mouseEvent: anEvent [
	
]

{ #category : #'mouse handlers' }
TbSpaceEventListener >> mouseMoveEvent: anEvent [
	self mouseProcessor handleMouseMove: anEvent
]

{ #category : #accessing }
TbSpaceEventListener >> mouseProcessor [
	^ self space mouseProcessor
]

{ #category : #'mouse handlers' }
TbSpaceEventListener >> mouseUpEvent: anEvent [
	self mouseProcessor handleMouseUp: anEvent
]

{ #category : #'other handlers' }
TbSpaceEventListener >> rotateEvent: anEvent [
]

{ #category : #'mouse handlers' }
TbSpaceEventListener >> scrollEvent: anEvent [
	self mouseProcessor processMouseScroll: anEvent
]

{ #category : #accessing }
TbSpaceEventListener >> space [
	^ space
]

{ #category : #accessing }
TbSpaceEventListener >> space: anObject [
	space := anObject
]

{ #category : #'window handlers' }
TbSpaceEventListener >> spaceCloseRequest: anEvent [
	self space close
]

{ #category : #'drag and drop' }
TbSpaceEventListener >> spaceDragCancel: anEvent [
	anEvent delegate cancel: anEvent position.
	self space removeEventHandler: mouseDragListener
]

{ #category : #'drag and drop' }
TbSpaceEventListener >> spaceDragLift: anEvent [
	| aDelegate aPosition |

	aDelegate := anEvent delegate.
	aPosition := anEvent position.

	aDelegate lift: aPosition in: self space root.

	mouseDragListener := TbEventHandler
		on: TbMouseMoveEvent
		do: [ :aMouseMoveEvent | aDelegate drag: aMouseMoveEvent position ].

	self space addEventHandler: mouseDragListener
]

{ #category : #'window handlers' }
TbSpaceEventListener >> spaceEventProcessedEvent: anEvent [
	self space keyboardProcessor handleSpaceEventProcessedEvent: anEvent
]

{ #category : #'window handlers' }
TbSpaceEventListener >> spaceFocusInEvent: anEvent [
	self focusProcessor processWindowFocusIn: anEvent
]

{ #category : #'window handlers' }
TbSpaceEventListener >> spaceFocusOutEvent: anEvent [
	self focusProcessor processWindowFocusOut: anEvent
]

{ #category : #'window handlers' }
TbSpaceEventListener >> spaceMovedEvent: anEvent [
	self space setPosition: anEvent position
]

{ #category : #'window handlers' }
TbSpaceEventListener >> spaceResizedEvent: anEvent [
	"Is sent after window size was changed"

	self space setExtent: anEvent extent
]

{ #category : #'other handlers' }
TbSpaceEventListener >> swipeEvent: anEvent [
]

{ #category : #'keyboard handlers' }
TbSpaceEventListener >> textInputEvent: anEvent [
	self keyboardProcessor processTextInput: anEvent
]

{ #category : #'touch handlers' }
TbSpaceEventListener >> touchDownEvent: anEvent [
	self touchProcessor handleTouchDown: anEvent
]

{ #category : #'touch handlers' }
TbSpaceEventListener >> touchMoveEvent: anEvent [
	self touchProcessor handleTouchMove: anEvent
]

{ #category : #accessing }
TbSpaceEventListener >> touchProcessor [
	^ self space touchProcessor
]

{ #category : #'touch handlers' }
TbSpaceEventListener >> touchUpEvent: anEvent [
	self touchProcessor handleTouchUp: anEvent
]

{ #category : #'other handlers' }
TbSpaceEventListener >> zoomEvent: anEvent [
]
