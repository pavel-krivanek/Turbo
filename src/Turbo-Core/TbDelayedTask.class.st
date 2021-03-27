Class {
	#name : #TbDelayedTask,
	#superclass : #TbTask,
	#instVars : [
		'delay',
		'element',
		'time',
		'isRunning',
		'startTime'
	],
	#category : #'Turbo-Core-Space-Support'
}

{ #category : #accessing }
TbDelayedTask >> delay [
	<return: #Duration>

	^ delay
]

{ #category : #accessing }
TbDelayedTask >> delay: aDuration [
	delay := aDuration
]

{ #category : #private }
TbDelayedTask >> dequeue [

	self
		assert: [ self isRunning ]
		description: [ 'I must be running to be dequeued' ].

	self element dequeueTask: self
]

{ #category : #accessing }
TbDelayedTask >> element [
	<return: #BlElement>

	^ element
]

{ #category : #accessing }
TbDelayedTask >> element: aBlElement [
	element := aBlElement
]

{ #category : #private }
TbDelayedTask >> enqueue [

	self
		assert: [ self isRunning ]
		description: [ 'I must be running to be enqueued' ].

	self element enqueueTask: self
]

{ #category : #initialization }
TbDelayedTask >> initialize [
	super initialize.
	
	delay := 500 milliSeconds.
	time := BlTime real.
	isRunning := true
]

{ #category : #'api - testing' }
TbDelayedTask >> isRunning [
	<return: #Boolean>

	^ isRunning
]

{ #category : #hooks }
TbDelayedTask >> onEnqueued: aBlSpace [
	super onEnqueued: aBlSpace.

	self time: aBlSpace time.
	
	"start time of the very first time when we are enqueued"
	startTime
		ifNil: [ startTime := self time now ]
]

{ #category : #hooks }
TbDelayedTask >> onEnqueuedInElement: aBlElement [
	self element: aBlElement
]

{ #category : #'api - running' }
TbDelayedTask >> onRun [
	"Override me to implement a custom action"
]

{ #category : #'api - running' }
TbDelayedTask >> run [
	self isRunning
		ifFalse: [ ^ self ].
	
	"time didn't come yet for me to run"
	(self time now < (startTime + self delay))
		ifTrue: [ ^ self enqueue ].
	
	self onRun.
	self stop
]

{ #category : #'api - running' }
TbDelayedTask >> start [
	self
		assert: [ element isNotNil ]
		description: [ 'Task must be attached to the element' ].

	isRunning := true.
	startTime := self time now.
	element ifNotNil: [ self dequeue ].
	self enqueue
]

{ #category : #'api - running' }
TbDelayedTask >> stop [
	"Stop the task by dequeuing it"
	(element isNotNil and: [ self isRunning ])
		ifTrue: [ self dequeue ].

	isRunning := false.
	startTime := nil
]

{ #category : #accessing }
TbDelayedTask >> time [
	<return: #BlTime>

	^ time
]

{ #category : #accessing }
TbDelayedTask >> time: aBlTime [
	time := aBlTime
]
