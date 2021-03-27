Class {
	#name : #BlDelayedTaskAction,
	#superclass : #BlDelayedTask,
	#instVars : [
		'action'
	],
	#category : #'Turbo-Core-Space-Support'
}

{ #category : #accessing }
BlDelayedTaskAction >> action [
	^ action
]

{ #category : #accessing }
BlDelayedTaskAction >> action: anObject [
	action := anObject
]

{ #category : #initialization }
BlDelayedTaskAction >> initialize [
	super initialize.
	
	action := [  ]
]

{ #category : #'api - running' }
BlDelayedTaskAction >> onRun [
	self action value
]
