Class {
	#name : #BlFlowLayoutRightToLeft,
	#superclass : #BlFlowLayoutDirection,
	#category : #'Turbo-Layout-Flow-Utilities'
}

{ #category : #testing }
BlFlowLayoutRightToLeft >> isLeftToRight [
	^ false
]

{ #category : #testing }
BlFlowLayoutRightToLeft >> isRightToLeft [
	^ true
]
