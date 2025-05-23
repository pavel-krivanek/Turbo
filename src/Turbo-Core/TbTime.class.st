"
I encapsulate a concept of time and play a role of a time provider for Animations or other parts of the system that compute durations or how much time passed since some action.

Bloc components must not directly rely on system time or hardcode it in any place because it prevents us from simulating spaces. The use of me makes system exemplifiable
"
Class {
	#name : 'TbTime',
	#superclass : 'Object',
	#instVars : [
		'frozenTime',
		'frozen'
	],
	#category : 'Turbo-Core-Universe',
	#package : 'Turbo-Core',
	#tag : 'Universe'
}

{ #category : 'instance creation' }
TbTime class >> fastForwarded [
	^ TbFastForwardedTime new
]

{ #category : 'instance creation' }
TbTime class >> real [
	^ TbRealTime new
]

{ #category : 'instance creation' }
TbTime class >> simulated [
	^ TbSimulatedTime new
]

{ #category : 'private - time' }
TbTime >> currentTime [
	^ self subclassResponsibility
]

{ #category : 'api - enumeration' }
TbTime >> every: aDuration during: aLoopDuration do: aDoBlock [
	| aStartTime |
	
	aStartTime := self now.

	self
		every: aDuration
		while: [ self now < (aStartTime + aLoopDuration) ]
		do: aDoBlock
]

{ #category : 'api - enumeration' }
TbTime >> every: aDuration times: aCountOfRepeats do: aDoBlock [
	"Evaluate a aDoBlock a given amount of times waiting a provided amount of time between executions.
	The first evaluation of a aDoBlock is instant.
	Note: evaluation is synchronous"
	| aCounter |
	
	aCounter := 0.
	self
		every: aDuration
		while: [ (aCounter := aCounter + 1) <= aCountOfRepeats ]
		do: aDoBlock
]

{ #category : 'api - enumeration' }
TbTime >> every: aDuration while: aWhileBlock do: aDoBlock [
	"Evaluate a aDoBlock while aWhileBlock evaluates to true waiting a given amount of time between executions.
	The first evaluation of a aDoBlock is instant.
	Note: evaluation is synchronous"
	
	self subclassResponsibility
]

{ #category : 'initialization' }
TbTime >> initialize [
	super initialize.
	
	frozen := false
]

{ #category : 'api - time' }
TbTime >> now [
	"Return a 'current' date and time, it is not necessarily a real one"
	<return: #DateAndTime>

	^ frozen
		ifTrue: [ frozenTime ]
		ifFalse: [ self currentTime ]
]

{ #category : 'printing' }
TbTime >> printOn: aStream [
	self now printOn: aStream
]

{ #category : 'api - time' }
TbTime >> synchronized: aBlock [
	"Make this time instance synchronized among all users.
	During evaluation of aBlock #now will return the same time, independent of
	how much time actually passed between calls"
	
	frozen := true.
	frozenTime := self currentTime.
	aBlock ensure: [
		frozen := false.
		frozenTime := nil ]
]

{ #category : 'api - time' }
TbTime >> wait: aDuration [
	"Advance clock by waiting for a given amount of time"

	self subclassResponsibility
]
