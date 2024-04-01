Class {
	#name : #TbSpaceFrameIdlePhase,
	#superclass : #TbSpaceFramePhase,
	#category : #'Turbo-Core-Space-Frame'
}

{ #category : #testing }
TbSpaceFrameIdlePhase >> isIdlePhase [
	^ true
]

{ #category : #accessing }
TbSpaceFrameIdlePhase >> name [
	^ 'Idle'
]

{ #category : #actions }
TbSpaceFrameIdlePhase >> runOn: aSpace [
	
]
