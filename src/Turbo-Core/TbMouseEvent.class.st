Class {
	#name : #TbMouseEvent,
	#superclass : #TbUIEvent,
	#instVars : [
		'delta'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #constants }
TbMouseEvent class >> anyButton [
	^ 7
]

{ #category : #constants }
TbMouseEvent class >> middleButton [
	self 
		deprecated: 'Use `BlMouseButton middle` instead'
		on: 	'17 January 2018' 
		in: 'Pharo-6.0-60520-'.
	^ BlMouseButton middle
]

{ #category : #constants }
TbMouseEvent class >> primaryButton [
	self 
		deprecated: 'Use `BlMouseButton primary` instead'
		on: 	'17 January 2018' 
		in: 'Pharo-6.0-60520-'.
	^ BlMouseButton primary
]

{ #category : #constants }
TbMouseEvent class >> secondaryButton [
	self 
		deprecated: 'Use `BlMouseButton secondary` instead'
		on: 	'17 January 2018' 
		in: 'Pharo-6.0-60520-'.
	^ BlMouseButton secondary
]

{ #category : #testing }
TbMouseEvent >> anyButtonPressed [
	^ button isNotNil
]

{ #category : #converting }
TbMouseEvent >> asDragEndEvent [
	
	^ BlDragEndEvent new
		copyFrom: self;
		yourself
]

{ #category : #converting }
TbMouseEvent >> asDragEnterEvent [
	"Convert the receiver into a mouse move"

	^ BlDragEnterEvent new
		copyFrom: self;
		yourself
]

{ #category : #converting }
TbMouseEvent >> asDragEvent [
	^ BlDragEvent new
		copyFrom: self;
		yourself
]

{ #category : #converting }
TbMouseEvent >> asDragLeaveEvent [
	"Convert the receiver into a mouse move"

	^ BlDragLeaveEvent new
		copyFrom: self;
		yourself
]

{ #category : #converting }
TbMouseEvent >> asDragOverEvent [
	^ BlDragOverEvent new
		copyFrom: self;
		yourself
]

{ #category : #converting }
TbMouseEvent >> asDragStartEvent [
	"Convert the receiver into a mouse move"

	^ BlDragStartEvent new
		copyFrom: self;
		yourself
]

{ #category : #converting }
TbMouseEvent >> asDropEvent [
	^ BlDropEvent new
		copyFrom: self;
		yourself
]

{ #category : #testing }
TbMouseEvent >> asMouseEnterEvent [
	^ BlMouseEnterEvent new
		copyFrom: self;
		yourself
]

{ #category : #testing }
TbMouseEvent >> asMouseLeaveEvent [
	^ BlMouseLeaveEvent new
		copyFrom: self;
		yourself
]

{ #category : #testing }
TbMouseEvent >> asMouseOutEvent [
	^ BlMouseOutEvent new
		copyFrom: self;
		yourself
]

{ #category : #testing }
TbMouseEvent >> asMouseOverEvent [
	^ BlMouseOverEvent new
		copyFrom: self;
		yourself
]

{ #category : #accessing }
TbMouseEvent >> delta [
	^ delta
]

{ #category : #accessing }
TbMouseEvent >> delta: anObject [
	delta := anObject
]

{ #category : #testing }
TbMouseEvent >> isMouse [
	^ true
]

{ #category : #testing }
TbMouseEvent >> middleButtonPressed [
	^ button = BlMouseButton middle
]

{ #category : #testing }
TbMouseEvent >> primaryButtonPressed [
	^ button = BlMouseButton primary
]

{ #category : #testing }
TbMouseEvent >> secondaryButtonPressed [
	^ button = BlMouseButton secondary
]

{ #category : #sending }
TbMouseEvent >> sendTo: anObject [
	anObject mouseEvent: self
]
