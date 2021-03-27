Class {
	#name : #TbBaseAnimation,
	#superclass : #TbTask,
	#traits : 'TTbEventTarget + TTbDebug',
	#classTraits : 'TTbEventTarget classTrait + TTbDebug classTrait',
	#instVars : [
		'loop',
		'delay',
		'time',
		'startTime',
		'progress',
		'elapsedTime',
		'loopCount',
		'isStarted',
		'isRunning',
		'parent',
		'actionHandlers',
		'target',
		'eventDispatcher',
		'loopDoneTime'
	],
	#category : #'Turbo-Animation-Basic'
}

{ #category : #'action  handling' }
TbBaseAnimation >> addOnFinishedHandler: anActionHandler [
	actionHandlers add: anActionHandler
]

{ #category : #accessing }
TbBaseAnimation >> animationManager [
	self 
		deprecated: 'Use BlElement>>#addAnimation:'
		on: 	'2 April 2018' 
		in: 'Pharo-6.0-60539-'.
		
	^ nil
]

{ #category : #'private - testing' }
TbBaseAnimation >> atLeastOneLoopDone [
	<return: #Boolean>
	
	^ loopDoneTime isNotNil
]

{ #category : #'api - configuration' }
TbBaseAnimation >> beInfinite [
	self loops: Float infinity
]

{ #category : #'private - testing' }
TbBaseAnimation >> canHaveNextLoop [
	<return: #Boolean>

	self
		assert: [ self isRunning ]
		description: [ 'I must be running' ].

	^ self isInfinite or: [ loopCount < loop ]
]

{ #category : #'api - time' }
TbBaseAnimation >> computedElapsedTime [
	"Return elapsed time (a duration) since actual animation start of the current loop including delay"
	<return: #Duration>
	self
		assert: [ self isStarted ]
		description: [ 'Animation is not yet started, I don''t know the elapsed time' ].

	^ (self time now - self delayedStartTime) min: self duration
]

{ #category : #'api - running' }
TbBaseAnimation >> continue [
	"try to prepare animation for the next loop and return true if animation should continue, false otherwise"
	<return: #Boolean>

	"We have done an animation loop, notify listeners"
	self notifyOnFinishedHandlers.

	loopCount := loopCount + 1.

	(self isInfinite or: [ loopCount < loop ])
		ifFalse: [ ^ false ].
	
	"If I am an infinite animation and loop limit is not hit
	we prepare ourselves for a next loop"
	self initStart.
	
	^ true
]

{ #category : #'api - accessing' }
TbBaseAnimation >> delay [
	"Return a delay duration which should be waited before animation actually starts"
	<return: #Duration>

	^ delay
]

{ #category : #'api - configuration' }
TbBaseAnimation >> delay: aDuration [
	self
		assert: [ aDuration >= 0 seconds ]
		description: [ 'Delay must not be negative' ].
	
	delay := aDuration asDuration
]

{ #category : #'api - time' }
TbBaseAnimation >> delayedStartTime [
	"Return a date and time at which animation is supposed to actually start taking delay into account"
	<return: #DateAndTime>

	self
		assert: [ self isStarted ]
		description: [ 'Animation is not yet started, I don''t know the delayed start time' ].

	^ self startTime + self delay
]

{ #category : #'api - running' }
TbBaseAnimation >> doStep [
]

{ #category : #'api - accessing' }
TbBaseAnimation >> duration [
	"Return animation duration. Duration can not necessarily be set manually, in case
	of composite animations it is computed on-fly based on durations of their sub-animations.
	Note: My duration should not take my own delay into account"
	<return: #Duration>

	^ self subclassResponsibility
]

{ #category : #'time management' }
TbBaseAnimation >> elapsedTime [
	<return: #Duration>

	^ elapsedTime
]

{ #category : #'api - running' }
TbBaseAnimation >> enqueue [
	self target ifNotNil: [ :anElement | anElement enqueueTask: self ]
]

{ #category : #'event management accessing' }
TbBaseAnimation >> eventDispatcher [
	"Return an object responsible for event dispatching"
	<return: #BlDirectEventDispatcher>

	^ eventDispatcher
]

{ #category : #'private - running' }
TbBaseAnimation >> initStart [

	"new loop should start exactly when previous ends"
	startTime := self atLeastOneLoopDone
		ifTrue: [ self loopDoneTime ]
		ifFalse: [ self time now ].

	progress := 0.
	elapsedTime := 0 milliSeconds.
	isRunning := true.
	isStarted := true
]

{ #category : #initialization }
TbBaseAnimation >> initialize [
	super initialize.
	
	actionHandlers := OrderedCollection new.
	eventDispatcher := BlDirectEventDispatcher on: self.
	
	delay := 0 milliSeconds. "configurable"
	loop := 1. "configurable"
	
	time := BlTime real.

	self reset.
	
]

{ #category : #testing }
TbBaseAnimation >> isInfinite [
	"Return true if animation is infinite (has unlimited anount of loops)"
	<return: #Boolean>

	^ self loops isInfinite
]

{ #category : #testing }
TbBaseAnimation >> isRunning [
	^ isRunning
]

{ #category : #testing }
TbBaseAnimation >> isStarted [
	<return: #Boolean>

	^ isStarted
]

{ #category : #testing }
TbBaseAnimation >> isSubAnimation [
	"Return true if I am a sub animation, e.g. added to composite animation,
	false otherwise"
	<return: #Boolean>

	^ self parent isNotNil
]

{ #category : #'api - time' }
TbBaseAnimation >> loopDoneTime [
	<return: #DateAndTime>

	self
		assert: [ self isStarted ]
		description: [ 'Animation is not yet started, I don''t know the loop end time' ].
	
	self
		assert: [ self atLeastOneLoopDone ]
		description: [ 'Loop is not ended yet' ].

	^ loopDoneTime
]

{ #category : #'api - accessing' }
TbBaseAnimation >> loops [
	"Return how many times animation should be repeated.
	If animation is infinite, return 0"
	<return: #Number>

	^ loop
]

{ #category : #'api - configuration' }
TbBaseAnimation >> loops: aNumber [
	self
		assert: [ aNumber >= 0 ]
		description: [ 'Amount of loops must not be negative' ].

	loop := aNumber
]

{ #category : #'api - time' }
TbBaseAnimation >> nextLoopStartTime [
	"Return a date and time at which the next animation repeat is supposed to start without taking delay of the next step into account"
	<return: #DateAndTime>

	self
		assert: [ self isStarted ]
		description: [ 'Animation is not yet started, I don''t know the delayed start time' ].

	^ self delayedStartTime + self duration
]

{ #category : #'private - notifying' }
TbBaseAnimation >> notifyLoopDone [
	self dispatchEvent: BlAnimationLoopDoneEvent new
]

{ #category : #'private - notifying' }
TbBaseAnimation >> notifyOnFinishedHandlers [
	self onFinished.
	actionHandlers do: [ :each | each actionPerformed ]
]

{ #category : #hooks }
TbBaseAnimation >> onEnqueued: aBlSpace [
	super onEnqueued: aBlSpace.
	
	self time: aBlSpace time
]

{ #category : #'action  handling' }
TbBaseAnimation >> onFinished [
]

{ #category : #'action  handling' }
TbBaseAnimation >> onFinishedDo: aBlock [
	self addOnFinishedHandler: (BlOnActionHandler do: aBlock)
]

{ #category : #hooks }
TbBaseAnimation >> onLoopDone [
	"Is sent right after a current loop is done"

	loopDoneTime := self delayedStartTime + self duration.
	loopCount := loopCount + 1.

	self notifyLoopDone
]

{ #category : #'action  handling' }
TbBaseAnimation >> onStep [
	self fireEvent: (BlAnimationStepEvent new progress: progress)
]

{ #category : #accessing }
TbBaseAnimation >> parent [
	^ parent
]

{ #category : #accessing }
TbBaseAnimation >> parent: anObject [
	parent := anObject
]

{ #category : #printing }
TbBaseAnimation >> printOn: aStream [
	super printOn: aStream.

	aStream
		space;
		nextPut: $(;
		nextPutAll: ((self progress * 100) roundTo: 0.01) asString;
		nextPut: $%;
		nextPut: $)
]

{ #category : #'api - accessing' }
TbBaseAnimation >> progress [
	"Return a normalized number within [0..1] representing animation progress.
	0 - means animation is not yet started.
	1 - animation loop is done"
	<return: #Number>

	^ progress
]

{ #category : #'api - running' }
TbBaseAnimation >> pulse [
	self 
		deprecated: 'Use run instead'
		on: 	'2 April 2018' 
		in: 'Pharo-6.0-60539-'.
	^ self run
]

{ #category : #'action  handling' }
TbBaseAnimation >> removeOnFinishedHandler: anActionHandler [
	actionHandlers remove: anActionHandler
]

{ #category : #'api - accessing' }
TbBaseAnimation >> repeats [
	"Return how many times animation was already repeated (loop count)"
	<return: #Number>

	^ loopCount
]

{ #category : #initialization }
TbBaseAnimation >> reset [	
	elapsedTime := 0 milliSeconds.
	startTime := nil.
	progress := 0.0.
	loopCount := 0.
	isRunning := false.
	isStarted := false.
	loopDoneTime := nil
]

{ #category : #'api - running' }
TbBaseAnimation >> run [

	self isStarted
		ifFalse: [ self start ].

	self isRunning
		ifFalse: [ ^ self ].

	self step.

	self shouldStop
		ifTrue: [ self stop ].

	"I am a sub-animation, so I am not registred is animation"
	self isSubAnimation
		ifTrue: [ ^ self ].

	self isRunning
		ifTrue: [ self enqueue ]
]

{ #category : #'private - testing' }
TbBaseAnimation >> shouldStartNextLoop [
	<return: #Boolean>

	^ self progress >= 1.0
		and: [ self canHaveNextLoop
			and: [ self time now > self nextLoopStartTime ] ]
]

{ #category : #'private - testing' }
TbBaseAnimation >> shouldStop [
	<return: #Boolean>

	^ self progress >= 1.0
		and: [ self canHaveNextLoop not ]
]

{ #category : #'api - running' }
TbBaseAnimation >> start [
	"self
		assert: [ self parent isNil ]
		description: [ 'A sub-animation has to be started from its parent' ]."
	
	self
		assert: [ self isRunning not ]
		description: [ 'Animation can not be start multiple times without stop' ].

	self initStart
]

{ #category : #'api - running' }
TbBaseAnimation >> startNextLoop [

	self initStart
]

{ #category : #pulse }
TbBaseAnimation >> startOn: aBlElement [
	"Start this animation with a given object playing a role of an animation target"
	
	self 
		deprecated: 'Use BlElement>>#addAnimation:'
		on: 	'2 April 2018' 
		in: 'Pharo-6.0-60539-'.
	
	aBlElement addAnimation: self
]

{ #category : #'api - time' }
TbBaseAnimation >> startTime [
	"Return a date and time at which the current animation loop was started"
	<return: #DateAndTime>

	self
		assert: [ self isStarted ]
		description: [ 'Animation is not yet started, I don''t know the start time' ].

	^ startTime
]

{ #category : #'api - running' }
TbBaseAnimation >> step [
	
	self shouldStartNextLoop
		ifTrue: [ self startNextLoop ].

	"Time did not come for me to run because of delay"	
	self time now < self delayedStartTime
		ifTrue: [ ^ self ].

	elapsedTime := self computedElapsedTime.

	self
		assert: [ self duration isZero not ]
		description: [ 'Duration must not be zero' ].
	progress := (elapsedTime / self duration) asFloat.
	self
		assert: [ progress between: 0 and: 1 ]
		description: [ 'Progress must be within interval [0..1]' ].

	progress <= 1.0
		"Animation is not over yet, execute an actual animation step"
		ifTrue: [
			self doStep.
			self onStep ].

	progress >= 1
		ifTrue: [ self onLoopDone ].
		
	(self shouldStartNextLoop
		and: [ self time now > self nextLoopStartTime ])
			ifTrue: [ self step ]
]

{ #category : #'api - running' }
TbBaseAnimation >> stop [

	self
		assert: [ self isRunning ]
		description: [ 'Animation is not running' ].

	isRunning := false
]

{ #category : #accessing }
TbBaseAnimation >> target [
	target ifNil:[ self parent ifNotNil:[:p| ^ p target]].
	^ target
]

{ #category : #accessing }
TbBaseAnimation >> target: anObject [
	target := anObject
]

{ #category : #accessing }
TbBaseAnimation >> time [
	<return: #BlTime>
	
	^ time
]

{ #category : #accessing }
TbBaseAnimation >> time: aBlTime [
	time := aBlTime
]
