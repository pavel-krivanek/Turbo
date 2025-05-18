Class {
	#name : 'TbMouseStillDownEvent',
	#superclass : 'TbMouseEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'testing' }
TbMouseStillDownEvent >> isMouseDown [
	^ true
]

{ #category : 'sending' }
TbMouseStillDownEvent >> sendTo: anObject [
	anObject mouseStillDownEvent: self
]
