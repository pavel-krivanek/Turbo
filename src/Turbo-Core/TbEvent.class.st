"
The specific announcement superclass for the context of Bloc.
"
Class {
	#name : #TbEvent,
	#superclass : #Announcement,
	#instVars : [
		'target',
		'source',
		'currentTarget',
		'timestamp',
		'canBePropagated',
		'consumed',
		'traversedTargets'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #'event management' }
TbEvent class >> fireEvent: anEvent [
	<return: #BlEvent>

	^ self fireEvent: anEvent target: anEvent target
]

{ #category : #'event management' }
TbEvent class >> fireEvent: anEvent target: anEventTarget [
	<return: #BlEvent>
	| theEvent aDispatcherChain |

	theEvent := anEvent.

	anEvent hasSource
		ifFalse: [ anEvent source: anEventTarget ].

	anEvent target = anEventTarget
		ifFalse: [ theEvent := anEvent newCopyFor: anEventTarget].

	aDispatcherChain := anEventTarget buildEventDispatchChain: BlEventDispatcherChain empty.
	^ aDispatcherChain dispatchEvent: theEvent
]

{ #category : #'private - steps' }
TbEvent >> arrivedTarget: aTBlEventTarget [
	self
		assert: [ aTBlEventTarget isNotNil ]
		description: [ 'Target must not be nil' ].

	currentTarget := aTBlEventTarget.	
	self traversedTargets add: (BlEventTraversalTargetStep new target: currentTarget)
]

{ #category : #'private - steps' }
TbEvent >> bubblingTarget: aTBlEventTarget [
	self
		assert: [ aTBlEventTarget isNotNil ]
		description: [ 'Target must not be nil' ].

	currentTarget := aTBlEventTarget.	
	self traversedTargets add: (TbEventTraversalBubblingStep new target: currentTarget)
]

{ #category : #testing }
TbEvent >> canBePropagated [
	^ canBePropagated ifNil: [ canBePropagated := true ]
]

{ #category : #'private - accessing' }
TbEvent >> canBePropagated: anObject [
	canBePropagated := anObject
]

{ #category : #'private - steps' }
TbEvent >> capturingTarget: aTBlEventTarget [
	self
		assert: [ aTBlEventTarget isNotNil ]
		description: [ 'Target must not be nil' ].

	currentTarget := aTBlEventTarget.	
	self traversedTargets add: (BlEventTraversalCapturingStep new target: currentTarget)
]

{ #category : #testing }
TbEvent >> consumed: aBoolean [
	consumed := aBoolean
]

{ #category : #copying }
TbEvent >> copyFrom: anEvent [
	super copyFrom: anEvent.

	"We re-initialize traversed targets in order to support event convertion like #asClickEvent
	because the event that we are copying from might have already other traversed targets"
	traversedTargets := LinkedList new.
	"new copies are not consumed yet"
	consumed := false
]

{ #category : #'api - accessing' }
TbEvent >> currentTarget [
	"Identifies the current target for the event, as the event traverses the scene graph.
	It always refers to the element to which the event handler has been attached, as opposed to #arget which identifies the element on which the event occurred."
	<return: #TBlEventTarget>

	^ currentTarget
]

{ #category : #'api - accessing' }
TbEvent >> currentTarget: anEventTarget [
	currentTarget := anEventTarget
]

{ #category : #firing }
TbEvent >> fire [
	BlEvent fireEvent: self
]

{ #category : #'private - steps' }
TbEvent >> forwardingTarget: aTBlEventTarget [
	self
		assert: [ aTBlEventTarget isNotNil ]
		description: [ 'Target must not be nil' ].

	currentTarget := aTBlEventTarget.	
	self traversedTargets add: (BlEventTraversalForwardingStep new target: currentTarget)
]

{ #category : #testing }
TbEvent >> hasSource [
	<return: #Boolean>
	
	^ source isNotNil
]

{ #category : #initialization }
TbEvent >> initialize [
	super initialize.
	
	traversedTargets := LinkedList new
]

{ #category : #testing }
TbEvent >> isBaseDrag [
	^ false
]

{ #category : #testing }
TbEvent >> isBaseFocus [
	^ false
]

{ #category : #testing }
TbEvent >> isBlur [
	^ false
]

{ #category : #testing }
TbEvent >> isClick [
	^ false
]

{ #category : #testing }
TbEvent >> isConsumed [
	^ consumed ifNil: [ consumed := false ]
]

{ #category : #testing }
TbEvent >> isDoubleClick [
	^ false
]

{ #category : #testing }
TbEvent >> isDrag [
	^ false
]

{ #category : #testing }
TbEvent >> isFocus [
	^ false
]

{ #category : #testing }
TbEvent >> isFocusIn [
	^ false
]

{ #category : #testing }
TbEvent >> isFocusOut [
	^ false
]

{ #category : #testing }
TbEvent >> isFocusTransfer [
	^ false
]

{ #category : #testing }
TbEvent >> isGesture [
	^ false
]

{ #category : #testing }
TbEvent >> isKeyboard [
	^ false
]

{ #category : #testing }
TbEvent >> isMouse [
	^ false
]

{ #category : #testing }
TbEvent >> isMouseDown [
	^ false
]

{ #category : #testing }
TbEvent >> isMouseEnter [
	^ false
]

{ #category : #testing }
TbEvent >> isMouseLeave [
	^ false
]

{ #category : #testing }
TbEvent >> isMouseMove [
	^ false
]

{ #category : #testing }
TbEvent >> isMouseUp [
	^ false
]

{ #category : #testing }
TbEvent >> isSpaceEvent [
	^ false
]

{ #category : #testing }
TbEvent >> isTextInput [
	^ false
]

{ #category : #testing }
TbEvent >> isTouch [
	^ false
]

{ #category : #firing }
TbEvent >> newCopyFor: aTarget [
	^ self class new
		copyFrom: self;
		target: aTarget;
		yourself
]

{ #category : #copying }
TbEvent >> postCopy [
	super postCopy.
	
	traversedTargets := traversedTargets copy
]

{ #category : #sending }
TbEvent >> sendTo: anObject [
	
]

{ #category : #accessing }
TbEvent >> source [
	"Return an event target that plays a role of a source of this event"
	<return: #BlEventTarget>

	self
		assert: [ self hasSource ]
		description: [ 'Can not access a source if there is no one' ].

	^ source
]

{ #category : #accessing }
TbEvent >> source: aBlEventTarget [
	
	self
		assert: [ self hasSource not ]
		description: [ 'Source can not be changed' ].
	
	source := aBlEventTarget
]

{ #category : #'api - accessing' }
TbEvent >> target [
	"Return a reference to the object that dispatched the event.
	It is different from #currentTarget when the event handler is called during the bubbling or capturing phase of the event."
	<return: #TBlEventTarget>

	^ target
]

{ #category : #'private - accessing' }
TbEvent >> target: aTBlEventTarget [
	target := aTBlEventTarget
]

{ #category : #'api - accessing' }
TbEvent >> timestamp [
	"Returns the time at which the event was created."
	<return: #DateAndTime>

	^ timestamp
]

{ #category : #'private - accessing' }
TbEvent >> timestamp: aDateAndTime [

	self
		assert: [ aDateAndTime isNumber not ]
		description: [ 'Number can not be used as a timestamp, use DateAndTime instead' ].

	timestamp := aDateAndTime
]

{ #category : #'api - accessing' }
TbEvent >> traversedTargets [
	^ traversedTargets
]
