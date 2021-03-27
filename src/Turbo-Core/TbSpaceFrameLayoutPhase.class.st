Class {
	#name : #TbSpaceFrameLayoutPhase,
	#superclass : #TbSpaceFramePhase,
	#category : #'Turbo-Core-Space-Frame'
}

{ #category : #testing }
TbSpaceFrameLayoutPhase >> isLayoutPhase [
	^ true
]

{ #category : #accessing }
TbSpaceFrameLayoutPhase >> name [
	^ 'Layout'
]

{ #category : #actions }
TbSpaceFrameLayoutPhase >> runOn: aSpace [
	aSpace
		dispatchTimeEvent: BlSpaceLayoutEndEvent
		during: [ :theSpace | theSpace isLayoutRequested ifTrue: [ theSpace doLayout ] ].
]
