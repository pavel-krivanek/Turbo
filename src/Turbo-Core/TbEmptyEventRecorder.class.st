"
I simply ignore all events (play a role event recorder in a space)
"
Class {
	#name : 'TbEmptyEventRecorder',
	#superclass : 'TbSpaceEventRecorder',
	#category : 'Turbo-Core-Space-Support',
	#package : 'Turbo-Core',
	#tag : 'Space-Support'
}

{ #category : 'api - recording' }
TbEmptyEventRecorder >> record: anEvent [
	"I ignore events"
]
