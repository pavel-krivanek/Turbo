"
I am a just a traditional real time.

[[[
	| aTime |
	aTime := BlTime real.
	aTime now
]]]
"
Class {
	#name : #TbRealTime,
	#superclass : #TbTime,
	#category : #'Turbo-Core-Universe'
}

{ #category : #'private - time' }
TbRealTime >> currentTime [
	"Return a 'current' date and time"
	<return: #DateAndTime>

	^ DateAndTime now
]

{ #category : #'api - enumeration' }
TbRealTime >> every: aDuration while: aWhileBlock do: aDoBlock [
	"Evaluate a aDoBlock while aWhileBlock evaluates to true waiting a given amount of time between executions.
	The first evaluation of a aDoBlock is instant.
	Note: evaluation is synchronous"
	| aStartTime aCount |

	aStartTime := self now.
	aCount := 0.

	aWhileBlock whileTrue: [
		| anExpectedTime aCurrentTime |
		aDoBlock value.
		
		aCount := aCount + 1.
		
		anExpectedTime := aStartTime + (aDuration * aCount).
		aCurrentTime := self now.
		(anExpectedTime - aCurrentTime) wait ]
]

{ #category : #'api - time' }
TbRealTime >> wait: aDuration [
	"Advance clock by waiting for a given amount of time"

	aDuration wait
]
