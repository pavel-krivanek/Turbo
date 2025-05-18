Class {
	#name : 'TbScrollableElementEventHandler',
	#superclass : 'TbElementEventListener',
	#category : 'Turbo-Core-Utilities - Scrolling',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Scrolling'
}

{ #category : 'mouse handlers' }
TbScrollableElementEventHandler >> gestureScrollEvent: anEvent [
	| aScrollHappened |

	aScrollHappened := anEvent currentTarget scrollBy: anEvent vector * 400.
	anEvent consumed: aScrollHappened
]

{ #category : 'mouse handlers' }
TbScrollableElementEventHandler >> scrollEvent: anEvent [
	| aScrollHappened |
	
	"I implement touch support, so ignore fake mouse wheel events"
	anEvent isTouch
		ifTrue: [ ^ self ].

	aScrollHappened := anEvent currentTarget scrollBy: anEvent vector * 20.
	anEvent consumed: aScrollHappened
]
