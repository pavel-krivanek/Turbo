Class {
	#name : #TbMouseUpEvent,
	#superclass : #TbMouseEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #'instance creation' }
TbMouseUpEvent class >> button: aMouseButton [
	"Create a sample button up event for a given button for testing purposes"
	<return: #BlMouseUpEvent>
	
	^ self new
		button: aMouseButton;
		position: 0@0;
		screenPosition: 0@0;
		timestamp: DateAndTime now
]

{ #category : #'instance creation' }
TbMouseUpEvent class >> middle [
	"Create a sample middle button up event for testing purposes"
	<return: #BlMouseUpEvent>

	^ self button: TbMouseButton middle
]

{ #category : #'instance creation' }
TbMouseUpEvent class >> primary [
	"Create a sample primary button up event for testing purposes"
	<return: #BlMouseUpEvent>
	
	^ self button: TbMouseButton primary
]

{ #category : #'instance creation' }
TbMouseUpEvent class >> secondary [
	"Create a sample secondary button up event for testing purposes"
	<return: #BlMouseUpEvent>
	
	^ self button: TbMouseButton secondary
]

{ #category : #converting }
TbMouseUpEvent >> asClickEvent [
	^ TbClickEvent new
		copyFrom: self;
		yourself
]

{ #category : #converting }
TbMouseUpEvent >> asDoubleClickEvent [
	^ BlDoubleClickEvent new
		copyFrom: self;
		yourself
]

{ #category : #testing }
TbMouseUpEvent >> isMouseUp [
	^ true
]

{ #category : #sending }
TbMouseUpEvent >> sendTo: anObject [
	anObject mouseUpEvent: self
]
