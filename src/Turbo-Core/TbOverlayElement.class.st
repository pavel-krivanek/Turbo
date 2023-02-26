"
Overlay element relocates and resizes itself to have exactly the same bounds as some reference element.

[[[
element := BlElement new.
overlay := BlOverlayElement on: element.
container addChild: overlay.
]]]


"
Class {
	#name : #TbOverlayElement,
	#superclass : #TbElement,
	#instVars : [
		'overlayListener',
		'referenceElement'
	],
	#category : #'Turbo-Core-Utilities - Overlay'
}

{ #category : #'instance creation' }
TbOverlayElement class >> on: anElement [
	^ self new attachTo: anElement
]

{ #category : #'api - attaching / detaching' }
TbOverlayElement >> attachTo: anElement [
	
	referenceElement = anElement
		ifTrue: [ ^ self ].
	
	self isAttached 
		ifTrue: [ self detach ].
	
	referenceElement := anElement.
	anElement addEventHandler: overlayListener
]

{ #category : #'api - attaching / detaching' }
TbOverlayElement >> detach [
	
	self isAttached
		ifFalse: [ ^ self ].
	
	referenceElement removeEventHandler: overlayListener.
	referenceElement := nil
]

{ #category : #initialization }
TbOverlayElement >> initialize [
	super initialize.
	
	overlayListener := TbOverlayListener for: self.
	self constraintsDo: [ :c | c ignoreByLayout ].
	self preventMouseEvents
]

{ #category : #'api - testing' }
TbOverlayElement >> isAttached [
	"Return true if I am attached to any element, false otherwise"
	<return: #Boolean>

	^ referenceElement isNotNil
]

{ #category : #layout }
TbOverlayElement >> measureMyBounds [
	"I compute by position and size in relation to the reference element"
	self
		assert: [ self isAttached ]
		description: [ 'I must be attached to the reference element to measure myself' ].
		
	self relocate: (overlayListener positionFor: referenceElement).
	self size: (overlayListener extentFor: referenceElement).
]

{ #category : #layout }
TbOverlayElement >> onMeasure: anExtentMeasurementSpec [

	self isAttached
		ifTrue: [ self measureMyBounds ].

	super onMeasure: anExtentMeasurementSpec
]
