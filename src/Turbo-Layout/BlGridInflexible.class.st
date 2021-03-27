Class {
	#name : #BlGridInflexible,
	#superclass : #BlGridFlexibility,
	#category : #'Turbo-Layout-Grid-Utilities'
}

{ #category : #comparing }
BlGridInflexible >> and: aFlexibility [
	aFlexibility andInflexible: self
]

{ #category : #comparing }
BlGridInflexible >> andCanStretch: aFlexibility [
	^ self
]

{ #category : #comparing }
BlGridInflexible >> andInflexible: aFlexibility [
	^ self
]
