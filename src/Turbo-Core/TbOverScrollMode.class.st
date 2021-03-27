Class {
	#name : #TbOverScrollMode,
	#superclass : #Object,
	#classInstVars : [
		'always',
		'ifContentScrolls',
		'never'
	],
	#category : #'Turbo-Core-Utilities - Scrolling Helpers'
}

{ #category : #accessing }
TbOverScrollMode class >> never [
	^ never ifNil: [ never := BlOverScrollNeverMode new ]
]
