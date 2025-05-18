"
I allow users to set a custom zoom level of content element within scalable element
"
Class {
	#name : 'TbScalableFixedStrategy',
	#superclass : 'TbScalableStrategy',
	#instVars : [
		'zoom'
	],
	#category : 'Turbo-Core-Utilities - Scalable',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Scalable'
}

{ #category : 'instance creation' }
TbScalableFixedStrategy class >> zoom: aNumber [
	^ self new zoom: aNumber
]

{ #category : 'comparing' }
TbScalableFixedStrategy >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].

	^ self zoom = anotherObject zoom
]

{ #category : 'comparing' }
TbScalableFixedStrategy >> hash [
	^ self class hash bitXor: self zoom hash
]

{ #category : 'initialization' }
TbScalableFixedStrategy >> initialize [
	super initialize.
	
	zoom := 1.0
]

{ #category : 'testing' }
TbScalableFixedStrategy >> isFixed [
	<return: #Boolean>
	
	^ true
]

{ #category : 'scale' }
TbScalableFixedStrategy >> scale: aContentElement within: aScalableElement [
	"Compute and return a scale factor of a content element within scalable element.
	Note: I am used during measurement pass, so you must only rely on measured bounds!"
	<return: #Number>
	
	^ self zoom
]

{ #category : 'accessing' }
TbScalableFixedStrategy >> zoom [
	<return: #Number>

	^ zoom
]

{ #category : 'accessing' }
TbScalableFixedStrategy >> zoom: aNumber [
	zoom := aNumber
]
