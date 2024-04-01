"
Is sent when element's position within its parent changes.

Note: position may change even if an element has no parent
"
Class {
	#name : #TbElementPositionChangedEvent,
	#superclass : #TbElementEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbElementPositionChangedEvent >> sendTo: anObject [
	anObject elementPositionChanged: self
]
