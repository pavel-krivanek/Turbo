Class {
	#name : 'TbTaskAction',
	#superclass : 'TbTask',
	#instVars : [
		'action'
	],
	#category : 'Turbo-Core-Space-Support',
	#package : 'Turbo-Core',
	#tag : 'Space-Support'
}

{ #category : 'accessing' }
TbTaskAction >> action [
	^ action
]

{ #category : 'accessing' }
TbTaskAction >> action: anObject [
	action := anObject
]

{ #category : 'initialization' }
TbTaskAction >> initialize [
	super initialize.
	
	action := [  ]
]

{ #category : 'running' }
TbTaskAction >> run [
	self action value
]
