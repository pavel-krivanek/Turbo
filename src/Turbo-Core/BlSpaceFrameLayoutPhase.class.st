Class {
	#name : #BlSpaceFrameLayoutPhase,
	#superclass : #BlSpaceFramePhase,
	#category : #'Turbo-Core-Space-Frame'
}

{ #category : #testing }
BlSpaceFrameLayoutPhase >> isLayoutPhase [
	^ true
]

{ #category : #accessing }
BlSpaceFrameLayoutPhase >> name [
	^ 'Layout'
]

{ #category : #actions }
BlSpaceFrameLayoutPhase >> runOn: aSpace [
	aSpace
		dispatchTimeEvent: BlSpaceLayoutEndEvent
		during: [ :theSpace | theSpace isLayoutRequested ifTrue: [ theSpace doLayout ] ].
]
