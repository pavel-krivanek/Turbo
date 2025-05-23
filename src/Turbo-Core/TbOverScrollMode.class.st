Class {
	#name : 'TbOverScrollMode',
	#superclass : 'Object',
	#classInstVars : [
		'always',
		'ifContentScrolls',
		'never'
	],
	#category : 'Turbo-Core-Utilities - Scrolling Helpers',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Scrolling Helpers'
}

{ #category : 'accessing' }
TbOverScrollMode class >> never [
	^ never ifNil: [ never := TbOverScrollNeverMode new ]
]
