"
Is sent when element's position within its parent changes.

Note: position may change even if an element has no parent
"
Class {
	#name : #BlElementPositionChangedEvent,
	#superclass : #BlElementEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
BlElementPositionChangedEvent >> sendTo: anObject [
	anObject elementPositionChanged: self
]
