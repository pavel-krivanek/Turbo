Class {
	#name : 'TbSpaceFrameDrawingPhase',
	#superclass : 'TbSpaceFramePhase',
	#category : 'Turbo-Core-Space-Frame',
	#package : 'Turbo-Core',
	#tag : 'Space-Frame'
}

{ #category : 'testing' }
TbSpaceFrameDrawingPhase >> isDrawingPhase [
	^ true
]

{ #category : 'accessing' }
TbSpaceFrameDrawingPhase >> name [
	^ 'Drawing'
]

{ #category : 'actions' }
TbSpaceFrameDrawingPhase >> runOn: aSpace [
	aSpace
		dispatchTimeEvent: TbSpaceRenderEndEvent
		during: [ :theSpace | theSpace hasDirtyAreas ifTrue: [ theSpace render ] ]
]
