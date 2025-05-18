Class {
	#name : 'TbMouseEvent',
	#superclass : 'TbUIEvent',
	#instVars : [
		'delta'
	],
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'constants' }
TbMouseEvent class >> anyButton [
	^ 7
]

{ #category : 'constants' }
TbMouseEvent class >> middleButton [
	self 
		deprecated: 'Use `BlMouseButton middle` instead'
		on: 	'17 January 2018' 
		in: 'Pharo-6.0-60520-'.
	^ TbMouseButton middle
]

{ #category : 'constants' }
TbMouseEvent class >> primaryButton [
	self 
		deprecated: 'Use `BlMouseButton primary` instead'
		on: 	'17 January 2018' 
		in: 'Pharo-6.0-60520-'.
	^ TbMouseButton primary
]

{ #category : 'constants' }
TbMouseEvent class >> secondaryButton [
	self 
		deprecated: 'Use `BlMouseButton secondary` instead'
		on: 	'17 January 2018' 
		in: 'Pharo-6.0-60520-'.
	^ TbMouseButton secondary
]

{ #category : 'testing' }
TbMouseEvent >> anyButtonPressed [
	^ button isNotNil
]

{ #category : 'converting' }
TbMouseEvent >> asDragEndEvent [
	
	^ TbDragEndEvent new
		copyFrom: self;
		yourself
]

{ #category : 'converting' }
TbMouseEvent >> asDragEnterEvent [
	"Convert the receiver into a mouse move"

	^ TbDragEnterEvent new
		copyFrom: self;
		yourself
]

{ #category : 'converting' }
TbMouseEvent >> asDragEvent [
	^ TbDragEvent new
		copyFrom: self;
		yourself
]

{ #category : 'converting' }
TbMouseEvent >> asDragLeaveEvent [
	"Convert the receiver into a mouse move"

	^ TbDragLeaveEvent new
		copyFrom: self;
		yourself
]

{ #category : 'converting' }
TbMouseEvent >> asDragOverEvent [
	^ TbDragOverEvent new
		copyFrom: self;
		yourself
]

{ #category : 'converting' }
TbMouseEvent >> asDragStartEvent [
	"Convert the receiver into a mouse move"

	^ TbDragStartEvent new
		copyFrom: self;
		yourself
]

{ #category : 'converting' }
TbMouseEvent >> asDropEvent [
	^ TbDropEvent new
		copyFrom: self;
		yourself
]

{ #category : 'testing' }
TbMouseEvent >> asMouseEnterEvent [
	^ TbMouseEnterEvent new
		copyFrom: self;
		yourself
]

{ #category : 'testing' }
TbMouseEvent >> asMouseLeaveEvent [
	^ TbMouseLeaveEvent new
		copyFrom: self;
		yourself
]

{ #category : 'testing' }
TbMouseEvent >> asMouseOutEvent [
	^ TbMouseOutEvent new
		copyFrom: self;
		yourself
]

{ #category : 'testing' }
TbMouseEvent >> asMouseOverEvent [
	^ TbMouseOverEvent new
		copyFrom: self;
		yourself
]

{ #category : 'accessing' }
TbMouseEvent >> delta [
	^ delta
]

{ #category : 'accessing' }
TbMouseEvent >> delta: anObject [
	delta := anObject
]

{ #category : 'testing' }
TbMouseEvent >> isMouse [
	^ true
]

{ #category : 'testing' }
TbMouseEvent >> middleButtonPressed [
	^ button = TbMouseButton middle
]

{ #category : 'testing' }
TbMouseEvent >> primaryButtonPressed [
	^ button = TbMouseButton primary
]

{ #category : 'testing' }
TbMouseEvent >> secondaryButtonPressed [
	^ button = TbMouseButton secondary
]

{ #category : 'sending' }
TbMouseEvent >> sendTo: anObject [
	anObject mouseEvent: self
]
