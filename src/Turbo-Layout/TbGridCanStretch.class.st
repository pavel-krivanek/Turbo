Class {
	#name : #TbGridCanStretch,
	#superclass : #TbGridFlexibility,
	#category : #'Turbo-Layout-Grid-Utilities'
}

{ #category : #comparing }
TbGridCanStretch >> and: aFlexibility [
	aFlexibility andCanStretch: self
]

{ #category : #comparing }
TbGridCanStretch >> andCanStretch: aFlexibility [
	^ self
]

{ #category : #comparing }
TbGridCanStretch >> andInflexible: aFlexibility [
	^ aFlexibility
]
