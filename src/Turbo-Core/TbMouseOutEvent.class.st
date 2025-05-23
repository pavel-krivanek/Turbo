"
The mouse out event is fired when a pointing device (usually a mouse) is moved off the element that has the listener attached or off one of its children. Note that it is also triggered on the parent when you move onto a child element, since you move out of the visible space of the parent. 

https://developer.mozilla.org/en-US/docs/Web/Events/mouseout
"
Class {
	#name : 'TbMouseOutEvent',
	#superclass : 'TbMouseEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbMouseOutEvent >> sendTo: anObject [
	anObject mouseOutEvent: self
]
