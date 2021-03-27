Class {
	#name : #TbRepeatedTaskAction,
	#superclass : #TbRepeatedTask,
	#instVars : [
		'action'
	],
	#category : #'Turbo-Core-Space-Support'
}

{ #category : #accessing }
TbRepeatedTaskAction >> action [
	^ action
]

{ #category : #accessing }
TbRepeatedTaskAction >> action: anObject [
	action := anObject
]

{ #category : #initialization }
TbRepeatedTaskAction >> initialize [
	super initialize.
	
	action := [  ]
]

{ #category : #'api - running' }
TbRepeatedTaskAction >> onRun [
	self action value
]
