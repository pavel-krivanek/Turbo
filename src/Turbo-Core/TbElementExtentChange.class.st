"
I represent an extent change and notify a corresponding BlElementExtentChangedEvent
"
Class {
	#name : 'TbElementExtentChange',
	#superclass : 'TbElementChange',
	#category : 'Turbo-Core-Basic-Changes',
	#package : 'Turbo-Core',
	#tag : 'Basic-Changes'
}

{ #category : 'notifying' }
TbElementExtentChange >> commitChange: anNewValue on: anElement [
	"Notify element event listeners that element's extent changed.
	Custom event handlers should subscribe to BlElementExtentChangedEvent"

	anElement onExtentChanged
]

{ #category : 'comparing' }
TbElementExtentChange >> compare: aNewValue with: anOldValue [
	"Return true if new value is equal (or close to) to new value"
	<return: #Boolean>

	^ aNewValue closeTo: anOldValue
]

{ #category : 'accessing' }
TbElementExtentChange >> name [
	^ 'Extent'
]
