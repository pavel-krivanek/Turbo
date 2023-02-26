Class {
	#name : #TbDelayedTaskAction,
	#superclass : #TbDelayedTask,
	#instVars : [
		'action'
	],
	#category : #'Turbo-Core-Space-Support'
}

{ #category : #accessing }
TbDelayedTaskAction >> action [
	^ action
]

{ #category : #accessing }
TbDelayedTaskAction >> action: anObject [
	action := anObject
]

{ #category : #initialization }
TbDelayedTaskAction >> initialize [
	super initialize.
	
	action := [  ]
]

{ #category : #'api - running' }
TbDelayedTaskAction >> onRun [
	self action value
]
