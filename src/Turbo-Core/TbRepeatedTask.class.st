Class {
	#name : #TbRepeatedTask,
	#superclass : #TbTask,
	#instVars : [
		'delay',
		'element',
		'time',
		'previousRunTime',
		'isRunning'
	],
	#category : #'Turbo-Core-Space-Support'
}

{ #category : #accessing }
TbRepeatedTask >> delay [
	<return: #Duration>

	^ delay
]

{ #category : #accessing }
TbRepeatedTask >> delay: aDuration [
	delay := aDuration
]

{ #category : #private }
TbRepeatedTask >> dequeue [

	self
		assert: [ self isRunning ]
		description: [ 'I must be running to be dequeued' ].

	self element dequeueTask: self
]

{ #category : #accessing }
TbRepeatedTask >> element [
	<return: #BlElement>

	^ element
]

{ #category : #accessing }
TbRepeatedTask >> element: aBlElement [
	element := aBlElement
]

{ #category : #private }
TbRepeatedTask >> enqueue [

	self
		assert: [ self isRunning ]
		description: [ 'I must be running to be enqueued' ].

	self element enqueueTask: self
]

{ #category : #initialization }
TbRepeatedTask >> initialize [
	super initialize.
	
	delay := 500 milliSeconds.
	time := TbTime real.
	isRunning := true
]

{ #category : #'api - testing' }
TbRepeatedTask >> isRunning [
	<return: #Boolean>

	^ isRunning
]

{ #category : #hooks }
TbRepeatedTask >> onEnqueued: aBlSpace [
	super onEnqueued: aBlSpace.
	
	self time: aBlSpace time
]

{ #category : #hooks }
TbRepeatedTask >> onEnqueuedInElement: aBlElement [
	self element: aBlElement
]

{ #category : #'api - running' }
TbRepeatedTask >> onRun [
	"Override me to implement a custom action"
]

{ #category : #'api - running' }
TbRepeatedTask >> run [

	self isRunning
		ifFalse: [ ^ self ].

	"time didn't come yet for me to run"
	(previousRunTime isNotNil and: [ self time now < (previousRunTime + self delay) ])
		ifTrue: [ ^ self enqueue ].
	
	self onRun.
	previousRunTime := previousRunTime
		ifNil: [ self time now ]
		ifNotNil: [ previousRunTime + self delay ].
	
	"it is possible that we stop the task in #onRun"
	self isRunning
		ifTrue: [ self enqueue ]
]

{ #category : #'api - running' }
TbRepeatedTask >> stop [
	isRunning := false
]

{ #category : #accessing }
TbRepeatedTask >> time [
	<return: #BlTime>

	^ time
]

{ #category : #accessing }
TbRepeatedTask >> time: aBlTime [
	time := aBlTime
]
