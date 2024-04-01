Class {
	#name : #TbTouchEvent,
	#superclass : #TbUIEvent,
	#instVars : [
		'pointerId',
		'pointerIndex',
		'delta',
		'pressure'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #accessing }
TbTouchEvent >> delta [
	"Return the distance moved in both x- and y-axis, given in space coordinates"
	<return: #Point>

	^ delta
]

{ #category : #accessing }
TbTouchEvent >> delta: aPoint [
	delta := aPoint
]

{ #category : #testing }
TbTouchEvent >> isTouch [
	^ true
]

{ #category : #accessing }
TbTouchEvent >> pointerId [
	"Return the unique id of a finger"
	<return: #Number>

	^ pointerId
]

{ #category : #accessing }
TbTouchEvent >> pointerId: aNumber [
	pointerId := aNumber
]

{ #category : #accessing }
TbTouchEvent >> pointerIndex [
	"Return the ordered index of a pointer. Assume user touches the display
	with two fingers, the first finger put on a display receives index '1'
	while the second finger index '2'. Index is different from an id in which id tends to be unique"
	<return: #Number>

	^ pointerIndex
]

{ #category : #accessing }
TbTouchEvent >> pointerIndex: aNumber [
	pointerIndex := aNumber
]

{ #category : #accessing }
TbTouchEvent >> pressure [
	"Return the quantity of pressure applied, normalized (0...1)"
	<return: #Number>

	^ pressure
]

{ #category : #accessing }
TbTouchEvent >> pressure: aNumber [
	pressure := aNumber
]
