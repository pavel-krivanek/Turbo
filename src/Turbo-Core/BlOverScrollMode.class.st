Class {
	#name : #BlOverScrollMode,
	#superclass : #Object,
	#classInstVars : [
		'always',
		'ifContentScrolls',
		'never'
	],
	#category : #'Turbo-Core-Utilities - Scrolling Helpers'
}

{ #category : #accessing }
BlOverScrollMode class >> never [
	^ never ifNil: [ never := BlOverScrollNeverMode new ]
]
