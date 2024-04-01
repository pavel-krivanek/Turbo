"
I am an extended version of a scalable element with zoom support
"
Class {
	#name : #TbZoomableElement,
	#superclass : #TbScalableElement,
	#instVars : [
		'zoomLevel'
	],
	#category : #'Turbo-Core-Utilities - Scalable'
}

{ #category : #initialization }
TbZoomableElement >> computeZoomLevel [
	"Compute zoom level based on the extent of a content element and its scale transformation"
	<return: #Number>

	self hasContentElement
		ifFalse: [ ^ 1 ].

	(self contentElement width isZero or: [ self contentElement height isZero ])
		ifTrue: [ ^ 1 ].

	^ (self contentElement bounds transformed extent / self contentElement extent) min
]

{ #category : #testing }
TbZoomableElement >> hasZoomLevel [
	"Return true if zoom level is user-defined, otherwise false"
	<return: #Boolean>

	^ zoomLevel isNotNil
]

{ #category : #initialization }
TbZoomableElement >> initialize [
	super initialize.
	
	zoomLevel := nil.
	self fitAll
]

{ #category : #zooming }
TbZoomableElement >> zoomIn [
	self zoomLevel: self zoomLevel + self zoomStep
]

{ #category : #accessing }
TbZoomableElement >> zoomLevel [
	<return: #Number>

	^ self hasZoomLevel
		ifTrue: [ zoomLevel ]
		ifFalse: [ self computeZoomLevel ]
]

{ #category : #accessing }
TbZoomableElement >> zoomLevel: aNumber [
	zoomLevel := aNumber.
	self fixed: zoomLevel.
	self constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent ]
]

{ #category : #zooming }
TbZoomableElement >> zoomOut [
	self zoomLevel: self zoomLevel - self zoomStep
]

{ #category : #zooming }
TbZoomableElement >> zoomReset [
	zoomLevel := nil.
	self fitAll.
	self constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ]
]

{ #category : #accessing }
TbZoomableElement >> zoomStep [
	^ 0.1
]
