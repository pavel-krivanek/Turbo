Class {
	#name : 'TbWidthEqualizer',
	#superclass : 'TbEqualizer',
	#instVars : [
		'sourceElements',
		'targetElements'
	],
	#category : 'Turbo-Core-Utilities - Equalizer',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Equalizer'
}

{ #category : 'as yet unclassified' }
TbWidthEqualizer class >> of: aCollectionOfTargetElements with: aCollectionOfSourceElements [
	^ self new
		sourceElements: aCollectionOfSourceElements;
		targetElements: aCollectionOfTargetElements
]

{ #category : 'element handlers' }
TbWidthEqualizer >> elementExtentChanged: anEvent [
	| maxWidth |

	maxWidth := self sourceElements max: #width.
	self targetElements do: [ :anElement | anElement width: maxWidth ]
]

{ #category : 'accessing' }
TbWidthEqualizer >> sourceElements [
	^ sourceElements
]

{ #category : 'accessing' }
TbWidthEqualizer >> sourceElements: aCollection [
	sourceElements := aCollection.
	sourceElements do: [ :anElement | anElement addEventHandler: self ]
]

{ #category : 'accessing' }
TbWidthEqualizer >> targetElements [
	^ targetElements
]

{ #category : 'accessing' }
TbWidthEqualizer >> targetElements: anObject [
	targetElements := anObject
]
