"
I am the Bloc main loop.
I indicate to the Universe that is time to synchronize the state of the elements. 

A pulse is fired all the 16ms to obtain 60 frames per second (fps) maximum.
The opened spaces listen the pulse to be synchronized and to update their state when it is needed.
"
Class {
	#name : 'TbPulseLoop',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'pulseEvent',
		'pulseStartTime',
		'lastElpasedTime',
		'waitingDelay',
		'loopProcess',
		'pulsePeriod',
		'session'
	],
	#category : 'Turbo-Core-Universe',
	#package : 'Turbo-Core',
	#tag : 'Universe'
}

{ #category : 'loop process' }
TbPulseLoop >> createLoopProcess [
	^ self createLoopTask newProcess
		priority: TbUniverse default mainLoopPriority;
		name: self processId;
		yourself
]

{ #category : 'loop process' }
TbPulseLoop >> createLoopTask [
	^ [ [ self firePulse ] repeat ]
]

{ #category : 'period' }
TbPulseLoop >> defaultPulsePeriod [
	^ 16 milliSeconds
]

{ #category : 'loop process' }
TbPulseLoop >> firePulse [
	pulseStartTime := DateAndTime now.
	self pulseEvent timestamp: pulseStartTime.
	TbUniverse default firePulse: self pulseEvent.
	self wait.
	Processor yield
]

{ #category : 'as yet unclassified' }
TbPulseLoop >> forceStartNewUIProcess [
	"I should only be used by the logic for opening the debugger.
	
	I create and start a new UI thread without stopping the previous one.
	Normally this leads to incorrect behaviou in Bloc UI process. However 
	if I am called from the current Bloc UI process when an error happened in 
	the actual process, and after calling me my sender terminates or suspends 
	the process my usage should be safe."
	
	loopProcess := self createLoopProcess.
	loopProcess resume.
]

{ #category : 'as yet unclassified' }
TbPulseLoop >> forceStartOfUIProcess: aProces [
	"I should only be used by the logic for closing the debugger."
	
	loopProcess := aProces.
	loopProcess resume.
]

{ #category : 'initialization' }
TbPulseLoop >> initialize [
	super initialize.
	pulseEvent := TbPulseEvent new.
	lastElpasedTime := 0.
	pulseStartTime := DateAndTime now.
]

{ #category : 'testing' }
TbPulseLoop >> isRunning [
	^ loopProcess isNotNil and: [ loopProcess isTerminated not ]
]

{ #category : 'testing' }
TbPulseLoop >> isRunningInTheSameProcess [
	^ Processor activeProcess effectiveProcess == loopProcess
]

{ #category : 'accessing' }
TbPulseLoop >> lastElpasedTime [
	^ lastElpasedTime
]

{ #category : 'accessing' }
TbPulseLoop >> loopProcess [
	^ loopProcess
]

{ #category : 'loop process' }
TbPulseLoop >> processId [
	^ 'Turbo Main Loop'
]

{ #category : 'accessing' }
TbPulseLoop >> pulseEvent [
	^ pulseEvent 
]

{ #category : 'period' }
TbPulseLoop >> pulsePeriod [
	^ pulsePeriod ifNil: [ pulsePeriod := self defaultPulsePeriod ]
]

{ #category : 'period' }
TbPulseLoop >> pulsePeriod: aTime [
	^ pulsePeriod := aTime
]

{ #category : 'lifecycle' }
TbPulseLoop >> start [
	self isRunning
		ifTrue: [ ^ self ].

	self
		assert: [ loopProcess isNil ]
		description: [ 'Loop process must not exist' ].

	loopProcess := self createLoopProcess.
	loopProcess resume
]

{ #category : 'lifecycle' }
TbPulseLoop >> stop [
	| currentProcess |
	
	self isRunning
		ifFalse: [ ^ self ].
	
	self
		assert: [ loopProcess isNotNil ]
		description: [ 'Loop process must exist!' ].

	currentProcess := loopProcess.
	loopProcess := nil.
	currentProcess terminate
]

{ #category : 'period' }
TbPulseLoop >> timeIsUp [
	^ DateAndTime now - pulseStartTime > self pulsePeriod
]

{ #category : 'period' }
TbPulseLoop >> wait [
	"Do not pause UI thread if there are no background tasks. UI becomes much smoother
(Processor nextReadyProcess == Processor backgroundProcess)
		ifFalse: [ (Delay forMilliseconds: milliSecs) wait ]."
	| milliSecs |
	milliSecs := (self pulsePeriod - (DateAndTime now - pulseStartTime)) min: 16 milliSeconds max: 0 milliSeconds.
	milliSecs isZero
		ifFalse: [ milliSecs wait ].

	lastElpasedTime := DateAndTime now
]
