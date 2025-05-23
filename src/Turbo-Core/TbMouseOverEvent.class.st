"
The mouse over event is fired when a pointing device is moved onto the element that has the listener attached or onto one of its children.

Similar to mouse enter, it differs in that it bubbles and that it is sent when the pointer is moved from one of its descendants' physical space to its own physical space.

https://developer.mozilla.org/en-US/docs/Web/Events/mouseover
"
Class {
	#name : 'TbMouseOverEvent',
	#superclass : 'TbMouseEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbMouseOverEvent >> sendTo: anObject [
	anObject mouseOverEvent: self
]
