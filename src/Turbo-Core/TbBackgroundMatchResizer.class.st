Class {
	#name : #TbBackgroundMatchResizer,
	#superclass : #TbBackgroundResizer,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Turbo-Core-Basic-Background'
}

{ #category : #cleanup }
TbBackgroundMatchResizer class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #accessing }
TbBackgroundMatchResizer class >> uniqueInstance [
	"Return unique instance of match resizer.
	Note: match resizer is stateless so it is preferable to share
	the same instance for memory and performance reasons"
	<return: #BlBackgroundMatchResizer>

	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #resizing }
TbBackgroundMatchResizer >> adapt: aBackground to: anElement [
	aBackground matchExtent: anElement extent
]
