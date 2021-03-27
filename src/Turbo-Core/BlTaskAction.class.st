Class {
	#name : #BlTaskAction,
	#superclass : #BlTask,
	#instVars : [
		'action'
	],
	#category : #'Turbo-Core-Space-Support'
}

{ #category : #accessing }
BlTaskAction >> action [
	^ action
]

{ #category : #accessing }
BlTaskAction >> action: anObject [
	action := anObject
]

{ #category : #initialization }
BlTaskAction >> initialize [
	super initialize.
	
	action := [  ]
]

{ #category : #running }
BlTaskAction >> run [
	self action value
]
