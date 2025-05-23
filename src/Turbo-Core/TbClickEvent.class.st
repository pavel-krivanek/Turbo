"
The click event is fired when a pointing device button (a mouse's primary button) is pressed and released on a single element.

The order of fired events:

 - Mouse Down
 - Mouse Up
 - Click
"
Class {
	#name : 'TbClickEvent',
	#superclass : 'TbMouseEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'testing' }
TbClickEvent >> isClick [
	^ true
]

{ #category : 'sending' }
TbClickEvent >> sendTo: anObject [
	anObject clickEvent: self
]
