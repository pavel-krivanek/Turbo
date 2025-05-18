"
I am used to record space events coming from the host window
"
Class {
	#name : 'TbSpaceEventRecorder',
	#superclass : 'Object',
	#category : 'Turbo-Core-Space-Support',
	#package : 'Turbo-Core',
	#tag : 'Space-Support'
}

{ #category : 'api - recording' }
TbSpaceEventRecorder >> onPulse [
	"Is sent by the space right before it starts fetching events"
]

{ #category : 'api - recording' }
TbSpaceEventRecorder >> record: anEvent [
	self subclassResponsibility
]
