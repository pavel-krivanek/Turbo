Class {
	#name : #BlSpaceFrameIdlePhase,
	#superclass : #BlSpaceFramePhase,
	#category : #'Turbo-Core-Space-Frame'
}

{ #category : #testing }
BlSpaceFrameIdlePhase >> isIdlePhase [
	^ true
]

{ #category : #accessing }
BlSpaceFrameIdlePhase >> name [
	^ 'Idle'
]

{ #category : #actions }
BlSpaceFrameIdlePhase >> runOn: aSpace [
	
]
