Class {
	#name : 'TbGridInflexible',
	#superclass : 'TbGridFlexibility',
	#category : 'Turbo-Layout-Grid-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Grid-Utilities'
}

{ #category : 'comparing' }
TbGridInflexible >> and: aFlexibility [
	aFlexibility andInflexible: self
]

{ #category : 'comparing' }
TbGridInflexible >> andCanStretch: aFlexibility [
	^ self
]

{ #category : 'comparing' }
TbGridInflexible >> andInflexible: aFlexibility [
	^ self
]
