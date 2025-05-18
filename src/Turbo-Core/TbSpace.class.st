"
I am the logical representation of a window in Bloc regardless the current Host in use.

"
Class {
	#name : 'TbSpace',
	#superclass : 'Object',
	#traits : 'TTbEventTarget + TTbSpaceProperties + TTbDebug',
	#classTraits : 'TTbEventTarget classTrait + TTbSpaceProperties classTrait + TTbDebug classTrait',
	#instVars : [
		'host',
		'hostSpace',
		'extent',
		'position',
		'root',
		'resizable',
		'borderless',
		'rootStyler',
		'dirtyAreas',
		'eventDispatcher',
		'eventListener',
		'eventRecorder',
		'mouseProcessor',
		'focusProcessor',
		'keyboardProcessor',
		'focusOwner',
		'dragboard',
		'nextPulseRequested',
		'currentCursor',
		'session',
		'focused',
		'title',
		'fullscreen',
		'layoutError',
		'tasks',
		'time',
		'touchProcessor',
		'frame',
		'gestureProcessor'
	],
	#category : 'Turbo-Core-Space',
	#package : 'Turbo-Core',
	#tag : 'Space'
}

{ #category : 'debug - simulation' }
TbSpace class >> locationOutside: anElement [
	"Return a random space location outside of element bounds"	
	| theBounds aPosition |
	
	anElement topMostParent forceLayout.
	theBounds := anElement bounds inSpace bounds.
	aPosition := {
		theBounds topRight - (theBounds width atRandom @ 100 atRandom).
		theBounds topRight + (100 atRandom @ theBounds height atRandom).
		theBounds bottomLeft + (theBounds width atRandom @ 100 atRandom).
		theBounds bottomLeft - (100 atRandom @ theBounds height atRandom).
	}	atRandom.
		
	self
		assert: [ (theBounds containsPoint: aPosition) not ]
		description: [ 'Point must be outside of the bounds' ].
		
	^ aPosition
]

{ #category : 'debug - simulation' }
TbSpace class >> simulateClickOn: anElement [
	"Simulate a click event in the middle of a given element by
	performing mouse down and mouse up events in a sequence"
	| aPosition |
	
	"we never know if an element was already layered out"
	anElement topMostParent forceLayout.
	aPosition := anElement bounds inSpace center.
	
	"we simulate a click with a sequence of low level mouse down/up events"
	self
		simulateEvents: {
			TbMouseDownEvent primary position: aPosition.
			TbMouseUpEvent primary position: aPosition }
		on: anElement
]

{ #category : 'debug - simulation' }
TbSpace class >> simulateClickOutside: anElement [
	"Simulate a click event in outside of a given element by
	performing mouse down and mouse up events in a sequence"
	| aPosition |
	
	aPosition := self locationOutside: anElement.
	"we simulate a click with a sequence of low level mouse down/up events"
	self
		simulateEvents: {
			TbMouseDownEvent primary position: aPosition.
			TbMouseUpEvent primary position: aPosition }
		on: anElement
]

{ #category : 'debug - simulation' }
TbSpace class >> simulateDragOn: anElement by: aBlVector [
	"Simulate a click event in the middle of a given element by
	performing mouse down and mouse up events in a sequence"
	| aPosition aDelta |

	"we never know if an element was already layered out"
	anElement topMostParent forceLayout.
	aPosition := anElement bounds inSpace center.
	
	aDelta := (anElement localBoundsToGlobal: (TbBounds origin: 0@0 extent: aBlVector)) extent.
	
	"we simulate a click with a sequence of low level mouse down/up events"
	self
		simulateEvents: {
			TbMouseDownEvent primary position: aPosition.
			TbMouseMoveEvent primary position: aPosition + aDelta.
			TbMouseUpEvent primary position: aPosition + aDelta }
		on: anElement
]

{ #category : 'debug - simulation' }
TbSpace class >> simulateEvent: anEvent on: anElement [
	"I simulate a given low level space UI event such as MouseUp/MouseDown or keyboard.
	If you would like to simulate a higher level event you could directly fire or dispatch them
	by asking any element to #fireEvent: or #dispatchEvent:
	Note: UI mouse events require to set #position: given in space coordinates or in root most parent
	coordiantes of the provided element.
	Note: I create a temporary space if provided element does not have one. if you need to simulate
	of sequence of dependent events it is better to use #simulateEvents:on: directy"

	self simulateEvents: { anEvent } on: anElement
]

{ #category : 'debug - simulation' }
TbSpace class >> simulateEvents: aCollectionOfEvents on: anElement [
	"I simulate a given sequence of low level space UI events such as MouseUp/MouseDown or keyboard.
	If you would like to simulate a higher level event you could directly fire or dispatch them
	by asking any element to #fireEvent: or #dispatchEvent:
	Note: UI mouse events require to set #position: given in space coordinates or in root most parent
	coordiantes of the provided element"
	
	"we should update timestamps"
	aCollectionOfEvents do: [ :anEvent | anEvent timestamp: DateAndTime now ].
	
	anElement isAttachedToSceneGraph
		ifTrue: [
			anElement space pulse.
			aCollectionOfEvents do: [ :anEvent | anElement space dispatchEvent: anEvent ].
			anElement space pulse ]
		ifFalse: [ 
			| temporarySpace topMostElement |
			topMostElement := anElement topMostParent.
			[ 
				temporarySpace := self new.
				temporarySpace root addChild: topMostElement.
				temporarySpace pulse.
				aCollectionOfEvents do: [ :anEvent | temporarySpace dispatchEvent: anEvent ].
				temporarySpace pulse
			] ensure: [ topMostElement removeFromParent ] ]
	
]

{ #category : 'debug - simulation' }
TbSpace class >> simulateMouseDownOn: anElement [
	"Simulate a mouse down event in the middle of a given element"
	| aPosition |
	
	"we never know if an element was already layered out"
	anElement topMostParent forceLayout.
	aPosition := anElement bounds inSpace center.

	self
		simulateEvents: { TbMouseDownEvent primary position: aPosition }
		on: anElement
]

{ #category : 'debug - simulation' }
TbSpace class >> simulateMouseMoveInside: anElement [
	"Simulate a mouse move event at a random location within element's bounds"
	| aPosition |
	
	"we never know if an element was already layered out"
	anElement topMostParent forceLayout.
	aPosition := anElement bounds inSpace bounds atRandom.

	self
		simulateEvents: { TbMouseMoveEvent primary position: aPosition }
		on: anElement
]

{ #category : 'debug - simulation' }
TbSpace class >> simulateMouseMoveOutside: anElement [
	"Simulate a mouse move event at a random location outside of element's bounds"
	| aPosition |
	
	"we never know if an element was already layered out"
	aPosition := self locationOutside: anElement.
	self
		simulateEvents: { TbMouseMoveEvent primary position: aPosition }
		on: anElement
]

{ #category : 'debug - simulation' }
TbSpace class >> simulateMouseUpOn: anElement [
	"Simulate a mouse up event in the middle of a given element"
	| aPosition |
	
	"we never know if an element was already layered out"
	anElement topMostParent forceLayout.
	aPosition := anElement bounds inSpace center.

	self
		simulateEvents: { TbMouseUpEvent primary position: aPosition }
		on: anElement
]

{ #category : 'api - adding' }
TbSpace >> addChild: anElement [
	"Add a given element as a direct child to the space root"
	
	self root addChild: anElement
]

{ #category : 'change reporting' }
TbSpace >> beDirtyArea [
	self makeDirty: (TbBounds origin: 0 @ 0 extent: self extent)
]

{ #category : 'window - properties' }
TbSpace >> borderless [
	^ self hostSpace
		ifNotNil: [ :aHostSpace | aHostSpace borderless ]
		ifNil: [ borderless ]
]

{ #category : 'window - properties' }
TbSpace >> borderless: aBoolean [
	borderless := aBoolean.
	 self hostSpace ifNotNil: [ :hw | hw borderless: aBoolean ].
]

{ #category : 'event management' }
TbSpace >> buildEventDispatchChain: aBlEventDispatcherChain [
	<return: #BlEventDispatcherChain>

	^ aBlEventDispatcherChain
]

{ #category : 'change reporting' }
TbSpace >> clearDirtyAreas [
	"Clear all dirty areas.
	Default implementation simply removes all areas from the collection"

	self dirtyAreas removeAll
]

{ #category : 'displaying' }
TbSpace >> close [
	"Delegate closing work to the Universe"
	TbUniverse default closeSpaceWindow: self
]

{ #category : 'cursor managing' }
TbSpace >> currentCursor [
	^ currentCursor 
]

{ #category : 'cursor managing' }
TbSpace >> currentCursor: aCursor [

	currentCursor ifNotNil: [ :cc | cc deactivateOn: self ].
	currentCursor := aCursor.
	currentCursor ifNil: [ ^ self updateCursorImage: Cursor normal ].
	currentCursor activateOn: self
]

{ #category : 'initialization' }
TbSpace >> defaultEventDispatcher [
	^ TbDirectEventDispatcher on: self
]

{ #category : 'initialization' }
TbSpace >> defaultEventListener [
	^ TbSpaceEventListener space: self
]

{ #category : 'initialization' }
TbSpace >> defaultEventRecorder [
	^ TbEmptyEventRecorder new
]

{ #category : 'change reporting' }
TbSpace >> defaultExtent [
	^ 800@600
]

{ #category : 'initialization' }
TbSpace >> defaultRoot [
	^ TbElement new
		background: self defaultRootBackground;
		labeled: self defaultRootLabel;
		yourself
]

{ #category : 'initialization' }
TbSpace >> defaultRootBackground [
	^ Color white
]

{ #category : 'initialization' }
TbSpace >> defaultRootLabel [
	^ 'Root element'
]

{ #category : 'initialization' }
TbSpace >> defaultRootStyler [
	^ self class environment
		at: #BrRootStyler
		ifPresent: [ :aStylerClass | aStylerClass on: self root ]
		ifAbsent: [ TbNullStyler new ]
]

{ #category : 'initialization' }
TbSpace >> defaultTitle [
	^ ''
]

{ #category : 'dragboard managing' }
TbSpace >> deleteDragboard [
	| d |
	d := self dragboard.
	self dragboard clear.
	self dragboard: nil.
	^ d
]

{ #category : 'accessing' }
TbSpace >> densityDpi [
	"Return the screen density expressed as dots-per-inch"
	<return: #Number>

	self hostSpace
		ifNotNil: [ :hw | ^ hw densityDpi ].

	"Without actual window we can only guess"
	^ 96.0
]

{ #category : 'api - tasks' }
TbSpace >> dequeueTask: aBlTask [
	self taskQueue dequeue: aBlTask
]

{ #category : 'host - accessing' }
TbSpace >> detachHostSpace [
	"Detach my current host space if I have one"

	self hostSpaceProperty value: nil
]

{ #category : 'accessing' }
TbSpace >> dirtyAreas [
	<return: #SequenceableCollection of: #BlBounds>

	^ dirtyAreas
]

{ #category : 'pulse' }
TbSpace >> dispatchTimeEvent: aSpaceStepEventClass during: aBlock [
	| aStartTime |
	
	aStartTime := self time now.
	aBlock cull: self.
	self eventDispatcher dispatchEvent:
			(aSpaceStepEventClass new
				start: aStartTime;
				end: self time now;
				yourself)
]

{ #category : 'pulse' }
TbSpace >> doLayout [
	| layoutCounter maxLayoutCount |

	self
		assert: [ self isLayoutRequested ]
		description: [ 'Root element must request layout in order to update it' ].

	[
		layoutCounter := 0.
		maxLayoutCount := 100.

		[ self hasLayoutError not and: [ self root isLayoutRequested and: [ layoutCounter < maxLayoutCount ] ] ]
			whileTrue: [
				self doUpdateLayout.
				layoutCounter := layoutCounter + 1.
				layoutCounter = 50
					ifTrue: [ 'Warning: Layout was performed 50 times per frame!' traceCr ] ].

		self root dispatchLayoutDone

	"I prevent infinite spawn of debuggers"
	] on: Error do: [ :anError |
		layoutError := anError.
		[ layoutError debug ] ensure: [ layoutError := nil ] ]
]

{ #category : 'pulse' }
TbSpace >> doUpdateFocus [
	self focusOwner
		ifNil: [ self initializeFocus ]
]

{ #category : 'pulse' }
TbSpace >> doUpdateLayout [
	"Start layouting process"

	self doUpdateLayout: self root
]

{ #category : 'pulse' }
TbSpace >> doUpdateLayout: anElement [
	"Perform layout of a given element (e.g. root or glass)"

	"first we measure.."
	anElement measure: (TbExtentMeasurementSpec new
		widthSpec: (anElement layout
			measurementSpecFor: (TbMeasurementSpec new beExact: self width)
			usedSize:  0
			resizer: TbLayoutResizer matchParent);
		heightSpec: (anElement layout
			measurementSpecFor: (TbMeasurementSpec new beExact: self height)
			usedSize:  0
			resizer: TbLayoutResizer matchParent)).

	"...then we layout in measured during previous step bounds"
	anElement applyLayoutIn: anElement measuredBounds asRectangle.
	anElement commitChanges
]

{ #category : 'accessing' }
TbSpace >> dragboard [
	^ dragboard
]

{ #category : 'accessing' }
TbSpace >> dragboard: anObject [
	dragboard := anObject
]

{ #category : 'api - tasks' }
TbSpace >> enqueueTask: aBlTask [
	aBlTask onEnqueued: self.
	self taskQueue enqueue: aBlTask.
]

{ #category : 'api - tasks' }
TbSpace >> enqueueTasksFrom: aTaskQueue [
	aTaskQueue tasks do: [ :eachTask | eachTask onEnqueued: self ].	
	self taskQueue enqueueFrom: aTaskQueue
]

{ #category : 'pulse' }
TbSpace >> ensureSession [
	"Check current session and perform required operations if it changed since last frame"

	session == Smalltalk session
		ifTrue: [ ^ self ].

	session := Smalltalk session.
	self beDirtyArea.
	self requestNextPulse
]

{ #category : 'event management accessing' }
TbSpace >> eventDispatcher [
	^ eventDispatcher
]

{ #category : 'accessing' }
TbSpace >> eventListener [
	^ eventListener
]

{ #category : 'accessing' }
TbSpace >> eventListener: anObject [
	eventListener := anObject
]

{ #category : 'accessing' }
TbSpace >> eventRecorder [
	^ eventRecorder
]

{ #category : 'accessing' }
TbSpace >> eventRecorder: anEventRecorder [
	eventRecorder := anEventRecorder
]

{ #category : 'accessing' }
TbSpace >> extent [
	<return: #Point>

	^ self windowExtent
]

{ #category : 'accessing' }
TbSpace >> extent: aNewExtent [
	self windowExtent: aNewExtent
]

{ #category : 'focus managing' }
TbSpace >> focusOwner [
	^ focusOwner
]

{ #category : 'focus managing' }
TbSpace >> focusOwner: anElement [
	focusOwner := anElement
]

{ #category : 'accessing' }
TbSpace >> focusProcessor [
	<return: #BlFocusProcessor>

	^ focusProcessor
]

{ #category : 'accessing' }
TbSpace >> focusProcessor: aFocusProcessor [
	focusProcessor := aFocusProcessor
]

{ #category : 'accessing' }
TbSpace >> focused [
	<return: #Boolean>

	^ self focusedProperty value
]

{ #category : 'accessing' }
TbSpace >> focused: aBoolean [
	self focusedProperty value: aBoolean
]

{ #category : 'accessing properties' }
TbSpace >> focusedProperty [
	^ focused ifNil: [ focused := TbObjectProperty on: self named: #focused default: false ]
]

{ #category : 'accessing' }
TbSpace >> frame [
	<return: #TbSpaceFrame>

	^ frame
]

{ #category : 'drawing' }
TbSpace >> fullDrawOn: anCanvas [
	anCanvas fullDraw: self root
]

{ #category : 'window - properties' }
TbSpace >> fullscreen [
	"Return true if an underlying window is in fullscreen mode,
	false otherwise"
	<return: #Boolean>

	^ self hostSpace
		ifNotNil: [ :aHostSpace | aHostSpace fullscreen ]
		ifNil: [ fullscreen ]
]

{ #category : 'window - properties' }
TbSpace >> fullscreen: aBoolean [
	"Switch underlying window to fullscreen if true is given
	and exit fullscreen mode if false is given"

	fullscreen := aBoolean.
	 self hostSpace ifNotNil: [ :aHostSpace | aHostSpace fullscreen: aBoolean ]
]

{ #category : 'accessing' }
TbSpace >> gestureProcessor [
	<return: #BlGestureProcessor>

	^ gestureProcessor
]

{ #category : 'focus managing' }
TbSpace >> grabFocus [
	self focused: true
]

{ #category : 'testing' }
TbSpace >> hasDirtyAreas [
	"Return true if space has dirty areas and therefore needs to be rendered,
	false otherwise"
	<return: #Boolean>
	
	^ self dirtyAreas isNotEmpty
]

{ #category : 'testing' }
TbSpace >> hasHostSpace [
	"Return true if I have a host space, false otherwise"
	<return: #Boolean>

	^ self hostSpace isNotNil
]

{ #category : 'testing' }
TbSpace >> hasLayoutError [
	"Return true if there was a layout error, false otherwise"
	<return: #Boolean>

	^ layoutError isNotNil
]

{ #category : 'testing' }
TbSpace >> hasOwner [
	"To be polymorhic with BlElement's traversal API.
	Space does not have an owner"
	<return: #Boolean>
	
	^ false
]

{ #category : 'accessing' }
TbSpace >> height [
	<return: #Number>

	^ self extent y
]

{ #category : 'displaying' }
TbSpace >> hide [
	self hostSpace ifNotNil: [ :hw | hw hide ]
]

{ #category : 'host - accessing' }
TbSpace >> host [
	^ host
]

{ #category : 'host - accessing' }
TbSpace >> host: aHost [
	host := aHost
]

{ #category : 'host - accessing' }
TbSpace >> hostSpace [
	^ self hostSpaceProperty value
]

{ #category : 'host - accessing' }
TbSpace >> hostSpace: aHostSpace [
	"Assign a host space window that will be a source of UI events
	and will provide a rendering surface on which I will be rendered.
	aHostSpace must not be nil"

	self
		assert: [ aHostSpace isNotNil ]
		description: [ 'Host space must not be nil!' ].

	self hostSpaceProperty value: aHostSpace.
	self hostSpaceChanged.
]

{ #category : 'as yet unclassified' }
TbSpace >> hostSpaceChanged [
	"When host space changed we might want to adapt sizes"
	self windowExtent: self windowExtent.
	"host space changed => renderer changed, we want to redraw the whole space"
	self beDirtyArea
]

{ #category : 'accessing properties' }
TbSpace >> hostSpaceProperty [
	^ hostSpace ifNil: [ hostSpace := TbObjectProperty on: self named: #hostSpace ]
]

{ #category : 'initialization' }
TbSpace >> initDispatcher [
	self eventDispatcher addEventFilter: self eventListener
]

{ #category : 'initialization' }
TbSpace >> initialize [
	super initialize.
	
	nextPulseRequested := true.
	session := Smalltalk session.
	dirtyAreas := OrderedCollection new.
	
	eventDispatcher := self defaultEventDispatcher.
	eventListener := self defaultEventListener.
	eventRecorder := self defaultEventRecorder.
	self initDispatcher.
	
	mouseProcessor := TbMouseProcessor space: self.
	focusProcessor := TbFocusProcessor space: self.
	keyboardProcessor := TbKeyboardProcessor space: self.
	touchProcessor := TbTouchProcessor space: self.
	gestureProcessor := TbGestureProcessor space: self.

	tasks := TbTaskQueue new.
	time := TbTime real.
	frame := TbSpaceFrame new.

	root := self defaultRoot.

	rootStyler := self defaultRootStyler.

	self extent: self defaultExtent.
	self position: 0@0.

	self resizable: true.
	self borderless: false.
	self fullscreen: false.
	self title: self defaultTitle.

	self updateCursorImage: Cursor normal.

	self root space: self
]

{ #category : 'focus managing' }
TbSpace >> initializeFocus [
	self root isFocusable
		ifTrue: [ self root requestFocus ]
]

{ #category : 'change reporting' }
TbSpace >> invalidRect: aBlBounds from: anElement [

	self makeDirty: aBlBounds.
	self requestNextPulse
]

{ #category : 'testing' }
TbSpace >> isFocused [
	^ self focused
]

{ #category : 'testing' }
TbSpace >> isLayoutRequested [
	"Indicates whether or not root element's layout needs to be updated next frame"
	<return: #Boolean>
	
	^ self root isLayoutRequested
]

{ #category : 'testing' }
TbSpace >> isVisible [
	^ self hasHostSpace
		ifTrue: [ self hostSpace isVisible ]
		ifFalse: [ false ]
]

{ #category : 'accessing' }
TbSpace >> keyboardProcessor [
	<return: #BlKeyboardProcessor>

	^ keyboardProcessor
]

{ #category : 'accessing' }
TbSpace >> keyboardProcessor: aKeyboardProcessor [
	keyboardProcessor := aKeyboardProcessor
]

{ #category : 'focus managing' }
TbSpace >> looseFocusFor: anElement [
			
	self focusProcessor looseFor: anElement
]

{ #category : 'change reporting' }
TbSpace >> makeDirty: aBlBounds [

	self
		assert: [ aBlBounds isKindOf: TbBounds ]
		description: [ 'Only BlBounds can be used as dirty area' ].

	aBlBounds expanded.
	self dirtyAreas
		ifEmpty: [ self dirtyAreas add: aBlBounds copy ]
		ifNotEmpty: [ :aCollection | aCollection first merge: aBlBounds ].
]

{ #category : 'displaying' }
TbSpace >> maximize [
	self hostSpace ifNotNil: [ :hw | hw maximize ]
]

{ #category : 'displaying' }
TbSpace >> maximized [
	self hostSpace ifNotNil: [ :hw | ^ hw maximized ].
	^ false
]

{ #category : 'displaying' }
TbSpace >> minimize [
	self hostSpace ifNotNil: [ :hw | hw minimize ]
]

{ #category : 'displaying' }
TbSpace >> minimized [
	self hostSpace ifNotNil: [ :hw | ^ hw minimized ].
	^ false
]

{ #category : 'accessing' }
TbSpace >> mouseProcessor [
	<return: #BlMouseProcessor>

	^ mouseProcessor
]

{ #category : 'accessing' }
TbSpace >> mouseProcessor: aMouseProcessor [
	mouseProcessor := aMouseProcessor
]

{ #category : 'dragboard managing' }
TbSpace >> newDragboard [
	self dragboard: (TbDragboard space: self).
	^ self dragboard
]

{ #category : 'window - properties' }
TbSpace >> position [
	"Return window's position in screen coordinates"
	<return: #Point>
	
	^ self hostSpace
		ifNotNil: [ :aHostSpace | aHostSpace position ]
		ifNil: [ position ]
]

{ #category : 'accessing' }
TbSpace >> position: aPoint [
	"Request to change window's position to a given point in screen corrdinates"

	self hasHostSpace
		ifTrue: [ self hostSpace position: aPoint ]
		ifFalse: [ self setPosition: aPoint ]
]

{ #category : 'pulse' }
TbSpace >> processEvents [
	"Process events enqueued by host space and dispatch them to the scene graph"

	self hostSpace preprocessEvents.

	self
		assert: [ self hasHostSpace ]
		description: [ 'Events can only be processed if I have a host space' ].

	self eventRecorder onPulse.
	self hostSpace fetchedEventsDo: [ :anEvent |
		self eventRecorder record: anEvent.
		self eventDispatcher dispatchEvent: anEvent ].

	self mouseProcessor generateEvents
]

{ #category : 'pulse' }
TbSpace >> processPulse [
	self ensureSession.

	self frame runOn: self.

	nextPulseRequested := false
]

{ #category : 'pulse' }
TbSpace >> pulse [
	self processPulse
]

{ #category : 'change reporting' }
TbSpace >> pulseRequested [
	"Return true if space pulse was requested, false otherwise"
	<return: #Boolean>

	^ nextPulseRequested
]

{ #category : 'pulse' }
TbSpace >> render [
	"Render this space in my host window if it is assigned, otherwise do nothing"

	self
		assert: [ self hasDirtyAreas ]
		description: [ 'I must have dirty areas in order to be rendered' ].

	self hostSpace
		ifNotNil: [ :aHostSpace | aHostSpace render: self ]
]

{ #category : 'focus managing' }
TbSpace >> requestFocusFor: anElement [
	self
		assert: [ anElement space = self ]
		description: [ 'anElement must be attached to the scenegraph owned by this space' ].
		
	self focusProcessor requestFor: anElement
]

{ #category : 'change reporting' }
TbSpace >> requestNextPulse [
	nextPulseRequested := true.
	
	"By the contract next pulse can be only requested if universe is running.
	It is done to not create pulse loop when it is actually not needed (for example during testing)"
	TbUniverse default isRunning
		ifTrue: [ TbUniverse default requestNextPulse ]
]

{ #category : 'window - properties' }
TbSpace >> resizable [
	"Return true if underlying window is resizable, false otherwise"
	<return: #Boolean>

	^ self hostSpace
		ifNotNil: [ :aHostSpace | aHostSpace resizable ]
		ifNil: [ resizable ]
]

{ #category : 'window - properties' }
TbSpace >> resizable: aBoolean [
	"Make underlying window resizable if true is given"
	
	resizable := aBoolean.
	self hostSpace ifNotNil: [ :aHostSpace | aHostSpace resizable: aBoolean ]
]

{ #category : 'accessing' }
TbSpace >> root [
	"Return my current root element.
	root can not be nil"
	<return: #BlElement>
	
	self
		assert: [ root isNotNil ]
		description: [ 'Root must not be nil' ].
	
	^ root
]

{ #category : 'accessing' }
TbSpace >> root: anElement [
	"Make a given element my root element.
	anElement must not be nil.
	anElement must not be added to any scene graph"
	
	self
		assert: [ anElement isNotNil ]
		description: [ 'anElement must not be nil' ].

	self
		assert: [ anElement space isNil ]
		description: [ 'New root must not be already have a space assigned!' ].

	anElement
		space: self;
		size: self extent.

	root := anElement.
	"Root styler is created for the root element. Since we change root element
	we must also recreate a styler"
	rootStyler := self defaultRootStyler
]

{ #category : 'accessing' }
TbSpace >> rootDo: aBlock [
	"A helper method to evaluate a given block with root element an argument.
	May be useful for scripting"

	aBlock value: self root
]

{ #category : 'accessing' }
TbSpace >> rootStyler [
	^ rootStyler
]

{ #category : 'pulse' }
TbSpace >> runTasks [
	"Run animations and other runnable tasks"

	self taskQueue run
]

{ #category : 'accessing' }
TbSpace >> session [
	^ session
]

{ #category : 'private - accessing' }
TbSpace >> setExtent: anExtent [
	"Actually change space and root extent to a given one"

	extent := anExtent.
	self root requestLayout
]

{ #category : 'private - accessing' }
TbSpace >> setPosition: aPoint [
	"Actually change space, root and glass extent to a given one"

	position := aPoint
]

{ #category : 'displaying' }
TbSpace >> show [
	"Open me in a window and show it to the user"

	"delegate showing work to the Universe"
	TbUniverse default showSpaceWindow: self.
	
	"Notify root element that it is now visible to the user"
	root dispatchAddedToSceneGraph.
	
	self requestNextPulse.
]

{ #category : 'api - tasks' }
TbSpace >> taskQueue [
	<return: #BlTaskQueue>
	
	^ tasks
]

{ #category : 'accessing' }
TbSpace >> time [
	<return: #BlTime>
	
	^ time
]

{ #category : 'accessing' }
TbSpace >> time: aBlTime [
	time := aBlTime
]

{ #category : 'window - properties' }
TbSpace >> title [
	"Return window's title as a string"
	<return: #String>

	^ self titleProperty value
]

{ #category : 'window - properties' }
TbSpace >> title: aString [
	"Change window's title"

	self titleProperty value: aString
]

{ #category : 'accessing properties' }
TbSpace >> titleProperty [
	^ title ifNil: [
		title := TbDelegateProperty
			on: self
			named: #title
			delegateTo: self hostSpaceProperty ]
]

{ #category : 'displaying' }
TbSpace >> toBack [
	self hostSpace ifNotNil: [ :hw | hw toBack ]
]

{ #category : 'displaying' }
TbSpace >> toFront [
	self hostSpace ifNotNil: [ :hw | hw toFront ]
]

{ #category : 'accessing' }
TbSpace >> topMostParent [
	^ self root
]

{ #category : 'accessing' }
TbSpace >> touchProcessor [
	<return: #BlTouchProcessor>

	^ touchProcessor
]

{ #category : 'focus managing' }
TbSpace >> transferFocusTo: anElement [
	self
		assert: [ anElement space = self ]
		description: [ 'anElement must be attached to the scenegraph owned by this space' ].
		
	self focusProcessor transferTo: anElement
]

{ #category : 'focus managing' }
TbSpace >> ungrabFocus [
	self focused: false
]

{ #category : 'cursor managing' }
TbSpace >> updateCursorImage: anImage [

	self hostSpace ifNotNil: [ :aHostSpace |
		aHostSpace cursor: anImage ]
]

{ #category : 'accessing' }
TbSpace >> width [
	<return: #Number>

	^ self extent x
]

{ #category : 'accessing' }
TbSpace >> windowExtent [
	"Return the window size in screen coordinates.
	This size may differ from the size in pixels on high dpi (retina) screens.
	Use #extent to get actual pixel size"
	<return: #Point>

	^ self hostSpace
		ifNotNil: [ :aHostSpace | aHostSpace windowExtent ]
		ifNil: [ extent ]
]

{ #category : 'accessing' }
TbSpace >> windowExtent: anExtent [
	"Request to change a window size to aNewExtent.
	Note, that window size may be different from renderer size on high dpi (retina) displays"

	self hasHostSpace
		ifTrue: [ self hostSpace windowExtent: anExtent ]
		ifFalse: [ self setExtent: anExtent ]
]

{ #category : 'accessing' }
TbSpace >> windowScale [
	"Return a scaling factor from space to window coordinates.
	On high dpi (retina) displays scaling factor is > 1"
	<return: #Point>

	^ self hostSpace
		ifNotNil: [ :aHostSpace | aHostSpace scaleFactor ]
		ifNil: [ 1.0 asPoint ]
]
