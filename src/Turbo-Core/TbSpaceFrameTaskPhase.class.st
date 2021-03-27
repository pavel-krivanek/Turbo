Class {
	#name : #TbSpaceFrameTaskPhase,
	#superclass : #TbSpaceFramePhase,
	#category : #'Turbo-Core-Space-Frame'
}

{ #category : #testing }
TbSpaceFrameTaskPhase >> isTaskPhase [
	^ true
]

{ #category : #accessing }
TbSpaceFrameTaskPhase >> name [
	^ 'Tasks processing'
]

{ #category : #actions }
TbSpaceFrameTaskPhase >> runOn: aSpace [
	"process animations and other runnable tasks"
	aSpace
		dispatchTimeEvent: BlSpaceTasksEndEvent
		during: [ :theSpace | theSpace runTasks ]
]
