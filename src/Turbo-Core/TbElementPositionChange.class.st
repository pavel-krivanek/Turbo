"
I represent a position change and notify a corresponding BlElementPositionChangedEvent
"
Class {
	#name : 'TbElementPositionChange',
	#superclass : 'TbElementChange',
	#category : 'Turbo-Core-Basic-Changes',
	#package : 'Turbo-Core',
	#tag : 'Basic-Changes'
}

{ #category : 'notifying' }
TbElementPositionChange >> commitChange: anNewValue on: anElement [
	"Notify element event listeners that position within parent has been changed.
	Custom event handlers should subscribe to BlElementPositionChangedEvent"
	
	anElement onPositionChanged.
	anElement onPositionInSpaceChanged.

	self notifyPositionInSpaceChanged: anElement
]

{ #category : 'comparing' }
TbElementPositionChange >> compare: aNewValue with: anOldValue [
	"Return true if new value is equal (or close to) to new value"
	<return: #Boolean>

	^ aNewValue closeTo: anOldValue
]

{ #category : 'accessing' }
TbElementPositionChange >> name [
	^ 'Position'
]

{ #category : 'notifying' }
TbElementPositionChange >> notifyPositionInSpaceChanged: anElement [
	
	anElement children
		select: [ :aChild | aChild changes isPositionChanged not ]
		thenDo: [ :aChild |
			aChild onPositionInSpaceChanged.
			self notifyPositionInSpaceChanged: aChild ]
]
