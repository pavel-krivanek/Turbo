Class {
	#name : #TbOnActionHandler,
	#superclass : #TbActionHandler,
	#instVars : [
		'action'
	],
	#category : #'Turbo-Core-Events-Handling'
}

{ #category : #'as yet unclassified' }
TbOnActionHandler class >> do: aBlock [
	^ self new
		action: aBlock;
		yourself
]

{ #category : #accessing }
TbOnActionHandler >> action [
	^ action
]

{ #category : #accessing }
TbOnActionHandler >> action: anObject [
	action := anObject
]

{ #category : #'as yet unclassified' }
TbOnActionHandler >> actionPerformed [
	action value
]
