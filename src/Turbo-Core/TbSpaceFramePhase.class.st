"
I represent a frame phase.

Each phase knows about its start time and send a corresponding event once the phase is completed.
"
Class {
	#name : #TbSpaceFramePhase,
	#superclass : #Object,
	#category : #'Turbo-Core-Space-Frame'
}

{ #category : #testing }
TbSpaceFramePhase >> isDrawingPhase [
	^ false
]

{ #category : #testing }
TbSpaceFramePhase >> isEventPhase [
	^ false
]

{ #category : #testing }
TbSpaceFramePhase >> isIdlePhase [
	^ false
]

{ #category : #testing }
TbSpaceFramePhase >> isLayoutPhase [
	^ false
]

{ #category : #testing }
TbSpaceFramePhase >> isTaskPhase [
	^ false
]

{ #category : #accessing }
TbSpaceFramePhase >> name [
	<return: #String>
	
	^ self subclassResponsibility
]

{ #category : #actions }
TbSpaceFramePhase >> runOn: aSpace [
	self subclassResponsibility
]
