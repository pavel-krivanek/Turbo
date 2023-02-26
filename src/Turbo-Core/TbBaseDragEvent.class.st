Class {
	#name : #TbBaseDragEvent,
	#superclass : #TbMouseEvent,
	#instVars : [
		'gestureSource',
		'gestureTarget',
		'dragboard',
		'startButtons'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #converting }
TbBaseDragEvent >> asDragEvent [
	^ self
]

{ #category : #accessing }
TbBaseDragEvent >> dragboard [
	^ dragboard
]

{ #category : #accessing }
TbBaseDragEvent >> dragboard: anObject [
	dragboard := anObject
]

{ #category : #accessing }
TbBaseDragEvent >> gestureSource [
	^ gestureSource
]

{ #category : #accessing }
TbBaseDragEvent >> gestureSource: anObject [
	gestureSource := anObject
]

{ #category : #accessing }
TbBaseDragEvent >> gestureTarget [
	^ gestureTarget
]

{ #category : #accessing }
TbBaseDragEvent >> gestureTarget: anObject [
	gestureTarget := anObject
]

{ #category : #testing }
TbBaseDragEvent >> isBaseDrag [
	^ true
]

{ #category : #testing }
TbBaseDragEvent >> isMiddleButtonDrag [
	^ startButtons = self class middleButton
]

{ #category : #testing }
TbBaseDragEvent >> isPrimaryButtonDrag [
	^ startButtons = self class primaryButton
]

{ #category : #testing }
TbBaseDragEvent >> isSecondaryButtonDrag [
	^ startButtons = self class secondaryButton
]

{ #category : #accessing }
TbBaseDragEvent >> startButtons [
	^ startButtons
]

{ #category : #accessing }
TbBaseDragEvent >> startButtons: anObject [
	startButtons := anObject
]
