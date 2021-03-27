Class {
	#name : #TbMouseDownEvent,
	#superclass : #TbMouseEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #'instance creation' }
TbMouseDownEvent class >> button: aMouseButton [
	"Create a sample button down event for a given button for testing purposes"
	<return: #BlMouseDownEvent>

	^ self new
		button: aMouseButton;
		position: 0@0;
		screenPosition: 0@0;
		timestamp: DateAndTime now
]

{ #category : #'instance creation' }
TbMouseDownEvent class >> middle [
	"Create a sample middle button down event for testing purposes"
	<return: #BlMouseDownEvent>

	^ self button: BlMouseButton middle
]

{ #category : #'instance creation' }
TbMouseDownEvent class >> primary [
	"Create a sample primary button down event for testing purposes"
	<return: #BlMouseDownEvent>
	
	^ self button: BlMouseButton primary
]

{ #category : #'instance creation' }
TbMouseDownEvent class >> secondary [
	"Create a sample secondary button down event for testing purposes"
	<return: #BlMouseDownEvent>
	
	^ self button: BlMouseButton secondary
]

{ #category : #converting }
TbMouseDownEvent >> asMouseStillDownEvent [
	^ BlMouseStillDownEvent new
		copyFrom: self;
		yourself
]

{ #category : #testing }
TbMouseDownEvent >> isMouseDown [
	^ true
]

{ #category : #sending }
TbMouseDownEvent >> sendTo: anObject [
	anObject mouseDownEvent: self
]
