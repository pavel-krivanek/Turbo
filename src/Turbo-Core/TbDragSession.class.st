Class {
	#name : #TbDragSession,
	#superclass : #Object,
	#instVars : [
		'dragRegistry'
	],
	#category : #'Turbo-Core-Utilities - Drag&Drop'
}

{ #category : #'drag and drop' }
TbDragSession >> drag: aDragItemOrItems from: aSourceElement [
	"Add provided drag items (or a single item) with a given element as its source to this drag session"
	
	dragRegistry at: aSourceElement put: aDragItemOrItems asOrderedCollection
]

{ #category : #initialization }
TbDragSession >> initialize [
	super initialize.

	dragRegistry := IdentityDictionary new
]
