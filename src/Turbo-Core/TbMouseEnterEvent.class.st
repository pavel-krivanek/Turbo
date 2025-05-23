"
The mouse enter event is fired when a pointing device (usually a mouse) is moved over the element that has the listener attached.

Similar to mouse over, it differs in that it doesn't bubble and that it isn't sent when the pointer is moved from one of its descendants' physical space to its own physical space.

With deep hierarchies, the amount of mouse enter events sent can be quite huge and cause significant performance problems. In such cases, it is better to listen for mouse over events.

https://developer.mozilla.org/en-US/docs/Web/Events/mouseenter
"
Class {
	#name : 'TbMouseEnterEvent',
	#superclass : 'TbMouseEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'testing' }
TbMouseEnterEvent >> isMouseEnter [
	^ true
]

{ #category : 'sending' }
TbMouseEnterEvent >> sendTo: anObject [
	anObject mouseEnterEvent: self
]
