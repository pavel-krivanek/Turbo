Class {
	#name : 'TbSpaceFrameEventPhase',
	#superclass : 'TbSpaceFramePhase',
	#category : 'Turbo-Core-Space-Frame',
	#package : 'Turbo-Core',
	#tag : 'Space-Frame'
}

{ #category : 'testing' }
TbSpaceFrameEventPhase >> isEventPhase [
	^ true
]

{ #category : 'accessing' }
TbSpaceFrameEventPhase >> name [
	^ 'Event processing'
]

{ #category : 'actions' }
TbSpaceFrameEventPhase >> runOn: aSpace [
	"We must update focused element before processing events, otherwise keyboard events,
	for example, will be handled by the wrong element"
	aSpace doUpdateFocus.

	aSpace
		dispatchTimeEvent: TbSpaceEventEndEvent
		during: [ :theSpace | theSpace hasHostSpace ifTrue: [ theSpace processEvents ] ]
]
