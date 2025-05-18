Class {
	#name : 'TbSpaceFrameLayoutPhase',
	#superclass : 'TbSpaceFramePhase',
	#category : 'Turbo-Core-Space-Frame',
	#package : 'Turbo-Core',
	#tag : 'Space-Frame'
}

{ #category : 'testing' }
TbSpaceFrameLayoutPhase >> isLayoutPhase [
	^ true
]

{ #category : 'accessing' }
TbSpaceFrameLayoutPhase >> name [
	^ 'Layout'
]

{ #category : 'actions' }
TbSpaceFrameLayoutPhase >> runOn: aSpace [
	aSpace
		dispatchTimeEvent: TbSpaceLayoutEndEvent
		during: [ :theSpace | theSpace isLayoutRequested ifTrue: [ theSpace doLayout ] ].
]
