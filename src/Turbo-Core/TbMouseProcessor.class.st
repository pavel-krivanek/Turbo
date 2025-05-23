"
I am an event processor.
I convert basic events to more complex events.
For example, i generate events like click, dbl click, drag&drop, ... from mouse down, mouse up, and mouse move events.

Mouse actions are blocked during drag
"
Class {
	#name : 'TbMouseProcessor',
	#superclass : 'TbBaseEventProcessor',
	#instVars : [
		'lastEnteredTargets',
		'lastOverTarget',
		'lastClickEvent',
		'isMouseStillDown',
		'currentDragTarget',
		'lastMouseTarget',
		'dndInProgress',
		'currentEnteredTargets',
		'dragStartMask',
		'pressedButtons',
		'dragState',
		'previousMouseDownEvent'
	],
	#category : 'Turbo-Core-Space-Support',
	#package : 'Turbo-Core',
	#tag : 'Space-Support'
}

{ #category : 'event testing' }
TbMouseProcessor >> canBeClickEvent: aMouseUpEvent [
	^ dndInProgress not
		and: [ (previousMouseDownEvent isNotNil and: [ previousMouseDownEvent primaryButtonPressed ])
				and: [ aMouseUpEvent target = previousMouseDownEvent target ] ]
]

{ #category : 'event testing' }
TbMouseProcessor >> canBeDblClickEvent: aMouseUpEvent [
	^ ((self canBeClickEvent: aMouseUpEvent) and:[lastClickEvent isNotNil])
		and: [ aMouseUpEvent timestamp - lastClickEvent timestamp < self dblClickDelay ]
]

{ #category : 'event testing' }
TbMouseProcessor >> canStartDrag: aMouseMoveEvent [
	<return: #Boolean>

	^ (pressedButtons includes: TbMouseButton primary)
		and: [ previousMouseDownEvent isNotNil
			and: [ previousMouseDownEvent primaryButtonPressed
				and: [ (aMouseMoveEvent position - previousMouseDownEvent position) r > self startDragThreshold ] ] ]
]

{ #category : 'accessing' }
TbMouseProcessor >> dblClickDelay [
	^ 300 milliSeconds
]

{ #category : 'event processing' }
TbMouseProcessor >> fillTargetHierarchy: aTarget [
	^ Array streamContents: [ :aStream |
		aStream nextPut: aTarget.
		aTarget allParentsDo: [ :aParentElement | aStream nextPut: aParentElement  ] ]
]

{ #category : 'event firing' }
TbMouseProcessor >> fireAsDragEndEvent: anEvent [

	self fireEvent:
			(anEvent asDragEndEvent
				startButtons: dragStartMask;
				target: currentDragTarget;
				gestureSource: currentDragTarget;
				dragboard: self space dragboard;
				yourself)
]

{ #category : 'event firing' }
TbMouseProcessor >> fireAsDragEnterEvent: anEvent targets: aCollection [
	aCollection
		do: [ :t | 
			self dispatchEvent:
					(anEvent asDragEnterEvent
						startButtons: dragStartMask;
						target: t;
						gestureSource: currentDragTarget;
						canBePropagated: false;
						yourself)
				target: t ]
]

{ #category : 'event firing' }
TbMouseProcessor >> fireAsDragEvent: anEvent [
	self	fireEvent:
			(anEvent asDragEvent
				startButtons: dragStartMask;
				target: currentDragTarget;
				gestureSource: currentDragTarget;
				dragboard: self space dragboard;
				yourself)
]

{ #category : 'event firing' }
TbMouseProcessor >> fireAsDragLeaveEvent: anEvent targets: aCollection [
	aCollection
		do:	[ :t | 
			self dispatchEvent:
					(anEvent asDragLeaveEvent
						startButtons: dragStartMask;
						target: t;
						gestureSource: currentDragTarget;
						canBePropagated: false;
						yourself)
					target: t ]
]

{ #category : 'event firing' }
TbMouseProcessor >> fireAsDragOverEvent: anEvent [
	self	fireEvent:
			(anEvent asDragOverEvent
				startButtons: dragStartMask;
				gestureSource: currentDragTarget;
				dragboard: self space dragboard;
				yourself)
]

{ #category : 'event firing' }
TbMouseProcessor >> fireAsDragStartEvent: anEvent [
	^ self fireEvent:
			(anEvent asDragStartEvent
				startButtons: dragStartMask;
				target: anEvent target;
				gestureSource: anEvent target;
				dragboard: self space newDragboard;
				yourself)
]

{ #category : 'event firing' }
TbMouseProcessor >> fireAsDropEvent: anEvent [

	self	fireEvent:
			(anEvent asDropEvent
				gestureSource: currentDragTarget;
				gestureTarget: anEvent target;
				startButtons: dragStartMask;
				dragboard: self space dragboard;
				yourself)
]

{ #category : 'event firing' }
TbMouseProcessor >> fireAsEnterEvent: anEvent targets: aCollection [
	aCollection
		do:	[ :t | 
			self dispatchEvent:
					(anEvent asMouseEnterEvent
						target: t;
						canBePropagated: false;
						yourself)
					target: t ]
]

{ #category : 'event firing' }
TbMouseProcessor >> fireAsLeaveEvent: anEvent targets: aCollection [
	aCollection
		do:	[ :t | 
			self dispatchEvent:
					(anEvent asMouseLeaveEvent
						target: t;
						canBePropagated: false;
						yourself)
					target:t ]
]

{ #category : 'event firing' }
TbMouseProcessor >> fireAsMouseOutEvent: aMouseEvent [
	self fireEvent: (aMouseEvent asMouseOutEvent target: lastOverTarget)
]

{ #category : 'event firing' }
TbMouseProcessor >> fireAsMouseOverEvent: aMouseEvent [
	self fireEvent: aMouseEvent asMouseOverEvent 
]

{ #category : 'event firing' }
TbMouseProcessor >> fireAsMouseStillDownEvent: anEvent [
	self fireEvent:
			(anEvent asMouseStillDownEvent
				timestamp: DateAndTime now;
				yourself)
]

{ #category : 'event processing' }
TbMouseProcessor >> generateEvents [
	(isMouseStillDown ~= 0 and: [ currentDragTarget isNil ])
		ifTrue: [ self fireAsMouseStillDownEvent: previousMouseDownEvent ]
]

{ #category : 'mouse down' }
TbMouseProcessor >> handleMouseDown: aMouseDownEvent [
	| aTargetElement |

	"First we need to register a pressed button"
	self pressedButtons add: aMouseDownEvent button.

	aTargetElement := self processPicking: aMouseDownEvent.
	aMouseDownEvent target: aTargetElement.

	self fireEvent: aMouseDownEvent.

	"now we can update the cursor from the target"
	self updateCursorFrom: aTargetElement.

	"store last mouse down event"
	previousMouseDownEvent := aMouseDownEvent
]

{ #category : 'mouse move' }
TbMouseProcessor >> handleMouseMove: aMouseMoveEvent [
	| aTargetElement shouldTryDragStart |
	"picking and mouse move"
	
	aTargetElement := self processPicking: aMouseMoveEvent.
	self
		assert: [ aTargetElement isAttachedToSceneGraph ]
		description: [ 'Target element must be attached to the scene graph' ].
	
	aMouseMoveEvent target: aTargetElement.

	shouldTryDragStart := self isDragging
		ifFalse: [ (self canStartDrag: aMouseMoveEvent) ]
		ifTrue: [ false ].

	self isDragging
		"we are dragging, handle it as drag move"
		ifTrue: [ self processDragMove: aMouseMoveEvent ]
		ifFalse: [ shouldTryDragStart
			ifTrue: [ (self tryDragStart: previousMouseDownEvent)
				"we sent drag start, have to send first drag move"
				ifTrue: [ self processDragMove: aMouseMoveEvent ]
				"drag start was not handled, process as basic mouse move"
				ifFalse: [ self processMouseMove: aMouseMoveEvent ] ]
			"no need to even try to start a drag"
			ifFalse: [ self processMouseMove: aMouseMoveEvent ] ]
]

{ #category : 'mouse up' }
TbMouseProcessor >> handleMouseUp: aMouseUpEvent [
	"DragEnd, Simple click and Dbl click"
	| aTargetElement |

	"if mouse button was not registered as pressed we can ignore this particular event"
	(self pressedButtons includes: aMouseUpEvent button)
		ifFalse: [ ^ self ].

	"we need to unregister a button"
	self pressedButtons remove: aMouseUpEvent button.

	aTargetElement := self processPicking: aMouseUpEvent.
	aMouseUpEvent target: aTargetElement.

	"depending on whether drag and drop is in process handle mouse up either
	as mouse up itself or as drag end event"
	self isDragging
		ifTrue: [ self processDragEnd: aMouseUpEvent ]
		ifFalse: [ self processMouseUp: aMouseUpEvent ]
]

{ #category : 'initialize-release' }
TbMouseProcessor >> initialize [
	super initialize.
	lastEnteredTargets := OrderedCollection new.
	isMouseStillDown := 0.
	dragStartMask := 0.
	dndInProgress := false.

	"a set of currently pressed mouse buttons button"
	pressedButtons := Set new.
	dragState := TbMouseDragState new
]

{ #category : 'testing' }
TbMouseProcessor >> isDragging [
	"Return true if drag and drop is in process, false otherwise"
	<return: #Boolean>
	
	^ dndInProgress
]

{ #category : 'event testing' }
TbMouseProcessor >> isValidDragTarget: aEvent [
	^ (aEvent target = self space root) not
]

{ #category : 'event processing' }
TbMouseProcessor >> postProcess: aMouseEvent [
	
]

{ #category : 'event processing' }
TbMouseProcessor >> preProcess: aMouseEvent [
	| aTarget |
	
	aTarget := self processPicking: aMouseEvent.

	aMouseEvent target: aTarget.

	"mouse move is only fired when no dnd is in progress (else it is a drag event)"
	dndInProgress ifFalse: [ self fireEvent: aMouseEvent ].
	"now we can update the cursor from the target"
	self updateCursorFrom: aTarget
]

{ #category : 'accessing' }
TbMouseProcessor >> pressedButtons [
	"Return a collection of currently pressed mouse buttons"
	<return: #Collection of: #BlMouseButton>

	^ pressedButtons
]

{ #category : 'mouse drag' }
TbMouseProcessor >> processDragEnd: aMouseUpEvent [

	self
		assert: [ self isDragging ]
		description: [ 'Can not process mouse up event as drag end if I am not in dragging state' ].
		
	self
		assert: [ currentDragTarget isNotNil ]
		description: [ 'When we drag something it can not be nil' ].

	aMouseUpEvent primaryButtonPressed
		ifTrue: [ 
			self fireAsDragEndEvent: aMouseUpEvent.
			self fireAsDropEvent: aMouseUpEvent.
						
			currentDragTarget := nil.
			dndInProgress := false.
			lastOverTarget := nil.
			dragStartMask := 0 ]
]

{ #category : 'mouse drag' }
TbMouseProcessor >> processDragMove: aMouseMoveEvent [

	"check drag"
	self fireAsDragEvent: aMouseMoveEvent.

	"dragstart/drag events management"
	currentDragTarget ifNotNil: [ self subprocessDragEnterExitEvent: aMouseMoveEvent ].
	
	"update last overed target"
	lastOverTarget := aMouseMoveEvent target.
	
	"store last entered targets"
	lastEnteredTargets := currentEnteredTargets
]

{ #category : 'mouse move' }
TbMouseProcessor >> processMouseEnterLeaveEvent: aMouseEvent [
	| newLeavedTargets newEnteredTargets  |

	"mouse is moved over the same element, no need to process enter/leave events"
	lastOverTarget = aMouseEvent target
		ifTrue: [ ^ self ].

	currentEnteredTargets := self fillTargetHierarchy: aMouseEvent target.
	
	"fire mouseout to the previous overed target"
	lastOverTarget isNotNil
		ifTrue: [ self fireAsMouseOutEvent: aMouseEvent ].
	
	"fire mouse leave events"
	newLeavedTargets := lastEnteredTargets reject: [ :anElement | (currentEnteredTargets includes: anElement) ].
	newLeavedTargets := newLeavedTargets select: #isAttachedToSceneGraph.

	self fireAsLeaveEvent: aMouseEvent targets: newLeavedTargets.
	
	"fire mouse event to the current target"
	self fireAsMouseOverEvent: aMouseEvent.
	
	"fire enter events"
	newEnteredTargets := currentEnteredTargets reject: [ :anElement | lastEnteredTargets includes: anElement ].
	self fireAsEnterEvent: aMouseEvent targets: newEnteredTargets.

	lastOverTarget := aMouseEvent target.
	lastEnteredTargets := currentEnteredTargets
]

{ #category : 'mouse move' }
TbMouseProcessor >> processMouseMove: aMouseMoveEvent [
	self processMouseEnterLeaveEvent: aMouseMoveEvent.

	self fireEvent: aMouseMoveEvent.

	"now we can update the cursor from the target"
	self updateCursorFrom: aMouseMoveEvent target.
	
]

{ #category : 'event handling entrypoint' }
TbMouseProcessor >> processMouseScroll: aMouseScrollEvent [
	"picking and mouse move"
	self preProcess: aMouseScrollEvent.
	"does nothing for the moment"
	self postProcess: aMouseScrollEvent
]

{ #category : 'mouse up' }
TbMouseProcessor >> processMouseUp: aMouseUpEvent [
	
	self fireEvent: aMouseUpEvent.
	
	self updateCursorFrom: aMouseUpEvent target.

	(self canBeClickEvent: aMouseUpEvent) ifTrue: [
		
		(self canBeDblClickEvent: aMouseUpEvent)
			ifTrue: [ 
				lastClickEvent := nil.
				self fireEvent: aMouseUpEvent asDoubleClickEvent ]
			ifFalse:[
				lastClickEvent := aMouseUpEvent.
				self fireEvent: aMouseUpEvent asClickEvent.
			] ]
]

{ #category : 'event processing' }
TbMouseProcessor >> processPicking: aMouseEvent [
	<return: #BlElement>
	| aTargetElement |

	(lastOverTarget isNotNil and: [ lastOverTarget isAttachedToSceneGraph not ])
		ifTrue: [ lastOverTarget := nil ].

	"if the last over target contains the point we can start picking from it"
	(aMouseEvent isMouseMove and: [ lastOverTarget isNotNil and: [ lastOverTarget containsGlobalPoint: aMouseEvent position ] ])
		ifTrue: [ aTargetElement := lastOverTarget findMouseEventTargetAt: aMouseEvent position ]
		ifFalse: [ aTargetElement := self space root findMouseEventTargetAt: aMouseEvent position ].
	"we have to ensure that aTarget is not nil"
	aTargetElement ifNil: [ aTargetElement := self space root ].
	^ aTargetElement
]

{ #category : 'accessing' }
TbMouseProcessor >> startDragThreshold [
	^ 4
]

{ #category : 'mouse drag' }
TbMouseProcessor >> subprocessDragEnterExitEvent: aMouseEvent [
	| newEnteredTargets newExitedTargets |

	self 
		assert: [ currentDragTarget isNotNil ]
		description: [ 'Can not process drag mouse event as enter / exit when there is no dragged element' ].
	
	currentEnteredTargets := self fillTargetHierarchy: aMouseEvent target.
	
	lastOverTarget = aMouseEvent target ifFalse:[
		newExitedTargets := lastEnteredTargets reject: [ :anElement | currentEnteredTargets includes: anElement ].
		newEnteredTargets := currentEnteredTargets reject: [ :anElement | lastEnteredTargets includes: anElement ].
		self fireAsDragLeaveEvent: aMouseEvent targets: newExitedTargets.
		self fireAsDragEnterEvent: aMouseEvent targets: newEnteredTargets ].

	"fire dragover event to current target"
	self fireAsDragOverEvent: aMouseEvent
]

{ #category : 'mouse drag' }
TbMouseProcessor >> tryDragStart: aMouseEvent [
	"Try to start a drag and return true if drag actually started, otherwise false"
	<return: #Boolean>
	| aDragTarget aDragStartEvent |
	
	aDragTarget := aMouseEvent target.
	
	aDragStartEvent := (aMouseEvent asDragStartEvent
		startButtons: dragStartMask;
		target: aDragTarget;
		gestureSource: aDragTarget;
		yourself).

	aDragStartEvent := self fireEvent: aDragStartEvent.
	
	currentDragTarget := aDragStartEvent isConsumed
		ifTrue: [ aDragStartEvent currentTarget ]
		ifFalse: [ nil ].

	^ dndInProgress := aDragStartEvent isConsumed
]

{ #category : 'event processing' }
TbMouseProcessor >> updateCursorFrom: aTarget [
	| t |
	t := aTarget.
	[ t mouseCursor isNil and: [ t parent isNotNil ] ] whileTrue: [ t := t parent ].
	self space currentCursor = t mouseCursor
		ifTrue: [ ^ self ].
	self space currentCursor: t mouseCursor
]

{ #category : 'event processing' }
TbMouseProcessor >> updateDragView [

]

{ #category : 'event processing' }
TbMouseProcessor >> updateFocusOwner: aNode [
	
]
