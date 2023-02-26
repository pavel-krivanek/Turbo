Class {
	#name : #TbEventListener,
	#superclass : #TbBasicEventHandler,
	#category : #'Turbo-Core-Events-Handling'
}

{ #category : #'focus handlers' }
TbEventListener >> blurEvent: anEvent [
]

{ #category : #'mouse handlers' }
TbEventListener >> clickEvent: anEvent [
	"The click event is fired when a pointing device button (usually a mouse's primary button) is pressed and released on a single element."
]

{ #category : #'mouse handlers' }
TbEventListener >> dblClickEvent: anEvent [
]

{ #category : #'dnd handlers' }
TbEventListener >> dragEndEvent: anEvent [
]

{ #category : #'dnd handlers' }
TbEventListener >> dragEnterEvent: anEvent [
]

{ #category : #'dnd handlers' }
TbEventListener >> dragEvent: anEvent [
]

{ #category : #'dnd handlers' }
TbEventListener >> dragLeaveEvent: anEvent [
]

{ #category : #'dnd handlers' }
TbEventListener >> dragOverEvent: anEvent [
]

{ #category : #'dnd handlers' }
TbEventListener >> dragStartEvent: anEvent [
]

{ #category : #'dnd handlers' }
TbEventListener >> dropEvent: anEvent [
]

{ #category : #'focus handlers' }
TbEventListener >> focusEvent: anEvent [
]

{ #category : #'focus handlers' }
TbEventListener >> focusInEvent: anEvent [
]

{ #category : #'focus handlers' }
TbEventListener >> focusOutEvent: anEvent [
]

{ #category : #'focus handlers' }
TbEventListener >> focusTransferEvent: anEvent [
]

{ #category : #'gesture handlers' }
TbEventListener >> gesturePinchBeginEvent: anEvent [
]

{ #category : #'gesture handlers' }
TbEventListener >> gesturePinchEndEvent: anEvent [
]

{ #category : #'gesture handlers' }
TbEventListener >> gesturePinchEvent: anEvent [
]

{ #category : #'gesture handlers' }
TbEventListener >> gestureRotationBeginEvent: anEvent [
]

{ #category : #'gesture handlers' }
TbEventListener >> gestureRotationEndEvent: anEvent [
]

{ #category : #'gesture handlers' }
TbEventListener >> gestureRotationEvent: anEvent [
]

{ #category : #'gesture handlers' }
TbEventListener >> gestureScrollBeginEvent: anEvent [
]

{ #category : #'gesture handlers' }
TbEventListener >> gestureScrollEndEvent: anEvent [
]

{ #category : #'gesture handlers' }
TbEventListener >> gestureScrollEvent: anEvent [
]

{ #category : #'gesture handlers' }
TbEventListener >> gestureSwipeAbortEvent: anEvent [
]

{ #category : #'gesture handlers' }
TbEventListener >> gestureSwipeBeginEvent: anEvent [
]

{ #category : #'gesture handlers' }
TbEventListener >> gestureSwipeEndEvent: anEvent [
]

{ #category : #'gesture handlers' }
TbEventListener >> gestureSwipeEvent: anEvent [
]

{ #category : #'event handling' }
TbEventListener >> handleEvent: anEvent [
	anEvent sendTo: self
]

{ #category : #'other handlers' }
TbEventListener >> inputMethodEvent: anEvent [
]

{ #category : #'keyboard handlers' }
TbEventListener >> keyDownEvent: anEvent [
]

{ #category : #'keyboard handlers' }
TbEventListener >> keyUpEvent: anEvent [
]

{ #category : #'keyboard handlers' }
TbEventListener >> keysPressedEvent: anEvent [
]

{ #category : #'keyboard handlers' }
TbEventListener >> keystrokeEvent: anEvent [
]

{ #category : #'other handlers' }
TbEventListener >> menuEvent: anEvent [
]

{ #category : #'mouse handlers' }
TbEventListener >> mouseDownEvent: anEvent [
]

{ #category : #'mouse handlers' }
TbEventListener >> mouseEnterEvent: anEvent [
]

{ #category : #'mouse handlers' }
TbEventListener >> mouseEvent: anEvent [
	
]

{ #category : #'mouse handlers' }
TbEventListener >> mouseLeaveEvent: anEvent [
]

{ #category : #'mouse handlers' }
TbEventListener >> mouseMoveEvent: anEvent [
]

{ #category : #'mouse handlers' }
TbEventListener >> mouseOutEvent: anEvent [
]

{ #category : #'mouse handlers' }
TbEventListener >> mouseOverEvent: anEvent [
]

{ #category : #'mouse handlers' }
TbEventListener >> mouseStillDownEvent: anEvent [
]

{ #category : #'mouse handlers' }
TbEventListener >> mouseUpEvent: anEvent [
]

{ #category : #'other handlers' }
TbEventListener >> rotateEvent: anEvent [
]

{ #category : #'mouse handlers' }
TbEventListener >> scrollEvent: anEvent [
]

{ #category : #'selection handlers' }
TbEventListener >> selectionAcquiredEvent: anEvent [
]

{ #category : #'selection handlers' }
TbEventListener >> selectionLostEvent: anEvent [
]

{ #category : #'keyboard handlers' }
TbEventListener >> shortcutEvent: anEvent [
]

{ #category : #'space handlers' }
TbEventListener >> spaceCloseRequest: anEvent [
]

{ #category : #'space handlers' }
TbEventListener >> spaceEvent: anEvent [
]

{ #category : #'space handlers' }
TbEventListener >> spaceFocusInEvent: anEvent [
]

{ #category : #'space handlers' }
TbEventListener >> spaceFocusOutEvent: anEvent [
]

{ #category : #'space handlers' }
TbEventListener >> spaceMouseEnterEvent: anEvent [
]

{ #category : #'space handlers' }
TbEventListener >> spaceMouseLeaveEvent: anEvent [
]

{ #category : #'space handlers' }
TbEventListener >> spaceMovedEvent: anEvent [
]

{ #category : #'space handlers' }
TbEventListener >> spaceResizedEvent: anEvent [
	"Is sent after window size was changed"
]

{ #category : #'other handlers' }
TbEventListener >> swipeEvent: anEvent [
]

{ #category : #'keyboard handlers' }
TbEventListener >> textInputEvent: anEvent [
]

{ #category : #'touch handlers' }
TbEventListener >> touchDownEvent: anEvent [
]

{ #category : #'gesture handlers' }
TbEventListener >> touchLongPressEvent: anEvent [
]

{ #category : #'touch handlers' }
TbEventListener >> touchMoveEvent: anEvent [
]

{ #category : #'touch handlers' }
TbEventListener >> touchUpEvent: anEvent [
]

{ #category : #'other handlers' }
TbEventListener >> zoomEvent: anEvent [
]
