"
I record events in a collection
"
Class {
	#name : #TbMemoryEventRecorder,
	#superclass : #TbSpaceEventRecorder,
	#instVars : [
		'events',
		'time',
		'pulseTimestamp'
	],
	#category : #'Turbo-Core-Space-Support'
}

{ #category : #accessing }
TbMemoryEventRecorder >> events [
	^ events
]

{ #category : #initialization }
TbMemoryEventRecorder >> initialize [
	super initialize.

	events := OrderedCollection new.
	time := BlTime real
]

{ #category : #'api - recording' }
TbMemoryEventRecorder >> onPulse [
	super onPulse.
	
	pulseTimestamp := self time now
]

{ #category : #'api - recording' }
TbMemoryEventRecorder >> record: anEvent [
	| aCopiedEvent |
	
	aCopiedEvent := anEvent copy.
	"we set our own timestamp to be able to differentiate what events were fetched within the same pulse (frame)"
	aCopiedEvent timestamp: pulseTimestamp.

	self events add: aCopiedEvent
]

{ #category : #accessing }
TbMemoryEventRecorder >> time [
	^ time
]
