"
The mouse move event is fired when a pointing device (usually a mouse) is moved while over an element.

https://developer.mozilla.org/en-US/docs/Web/Events/mousemove
"
Class {
	#name : #TbMouseMoveEvent,
	#superclass : #TbMouseEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #'instance creation' }
TbMouseMoveEvent class >> button: aMouseButton [
	"Create a sample button move event"
	<return: #BlMouseMoveEvent>

	^ self new
		button: aMouseButton;
		position: 0@0;
		screenPosition: 0@0;
		timestamp: DateAndTime now
]

{ #category : #'instance creation' }
TbMouseMoveEvent class >> middle [
	"Create a mouse move event for testing purposes"
	<return: #BlMouseMoveEvent>

	^ self button: TbMouseButton middle
]

{ #category : #'instance creation' }
TbMouseMoveEvent class >> primary [
	"Create a mouse move event for testing purposes"
	<return: #BlMouseMoveEvent>
	
	^ self button: TbMouseButton primary
]

{ #category : #'instance creation' }
TbMouseMoveEvent class >> secondary [
	"Create a mouse move event for testing purposes"
	<return: #BlMouseMoveEvent>
	
	^ self button: TbMouseButton secondary
]

{ #category : #testing }
TbMouseMoveEvent >> isMouseMove [
	^ true
]

{ #category : #sending }
TbMouseMoveEvent >> sendTo: anObject [
	anObject mouseMoveEvent: self
]
