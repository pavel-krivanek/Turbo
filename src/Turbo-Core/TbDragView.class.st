Class {
	#name : #TbDragView,
	#superclass : #TbElement,
	#instVars : [
		'target'
	],
	#category : #'Turbo-Core-Space-Support'
}

{ #category : #'as yet unclassified' }
TbDragView class >> on: aForm [
	^ self new target: aForm
]

{ #category : #initialization }
TbDragView >> initialize [
	super initialize.
	self border: (TbBorder paint: Color veryLightGray width: 1).
	self background: (Color white).
	self effect: (TbDropShadowEffect new color: Color gray; width:2; offset:2@2)
]

{ #category : #accessing }
TbDragView >> target [
	^ target
]

{ #category : #accessing }
TbDragView >> target: aForm [
	target := aForm asForm. 
	
	self extent: target extent.
]

{ #category : #'as yet unclassified' }
TbDragView >> updateFromCursorPosition: aPosition [
	self position: aPosition - (self extent / 2)
]
