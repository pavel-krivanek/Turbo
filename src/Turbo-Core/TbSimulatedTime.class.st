"
I am a simulated time that must be progressed manually by setting ===#date:=== directly or by advancing the clock by a duration.

[[[
	| aTime |
	aTime := BlTime simulated.
	aTime date: (DateAndTime year: 2018 month: 3 day: 31).
	aTime wait: 2 seconds. ""progress clock by 2 seconds""
	aTime now
]]]
"
Class {
	#name : 'TbSimulatedTime',
	#superclass : 'TbTime',
	#instVars : [
		'date'
	],
	#category : 'Turbo-Core-Universe',
	#package : 'Turbo-Core',
	#tag : 'Universe'
}

{ #category : 'instance creation' }
TbSimulatedTime class >> date: aDateAndTime [
	^ self new date: aDateAndTime
]

{ #category : 'private - time' }
TbSimulatedTime >> currentTime [
	"Return a 'current' date and time"
	<return: #DateAndTime>
	
	^ date
]

{ #category : 'initialization' }
TbSimulatedTime >> date: aDateAndTime [
	date := aDateAndTime
]

{ #category : 'api - enumeration' }
TbSimulatedTime >> every: aDuration while: aWhileBlock do: aDoBlock [
	"Evaluate a aDoBlock while aWhileBlock evaluates to true waiting a given amount of time between executions.
	The first evaluation of a aDoBlock is instant.
	Note: evaluation is synchronous"

	aWhileBlock whileTrue: [
		aDoBlock value.
		self date: self now + aDuration ]
]

{ #category : 'initialization' }
TbSimulatedTime >> initialize [
	super initialize.
	
	date := DateAndTime now
]

{ #category : 'api - time' }
TbSimulatedTime >> wait: aDuration [
	"Advance clock by waiting for a given amount of time"

	self date: self now + aDuration
]
