Class {
	#name : 'TbGridOrientation',
	#superclass : 'Object',
	#classVars : [
		'HORIZONTAL',
		'VERTICAL'
	],
	#category : 'Turbo-Layout-Grid-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Grid-Utilities'
}

{ #category : 'factory' }
TbGridOrientation class >> horizontal [
	^ HORIZONTAL
]

{ #category : 'class initialization' }
TbGridOrientation class >> initialize [
	super initialize.
	
	HORIZONTAL := TbGridHorizontalOrientation new.
	VERTICAL := TbGridVerticalOrientation new.
]

{ #category : 'factory' }
TbGridOrientation class >> vertical [
	^ VERTICAL
]

{ #category : 'comparing' }
TbGridOrientation >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : 'testing' }
TbGridOrientation >> isHorizontal [
	^ false
]

{ #category : 'testing' }
TbGridOrientation >> isVertical [
	^ false
]
