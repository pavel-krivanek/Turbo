Class {
	#name : #TbLinearLayoutOrientation,
	#superclass : #Object,
	#instVars : [
		'layout'
	],
	#category : #'Turbo-Layout-Linear-Utilities'
}

{ #category : #accessing }
TbLinearLayoutOrientation >> applyLayoutIn: aLinearLayout [
	layout := aLinearLayout
]

{ #category : #orientation }
TbLinearLayoutOrientation >> breadthMode [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> breadthProperties: anElement [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> breadthSpec [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> breadthSpec: anExtentSpec [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> extentBreadth: breadth lengthSpec: length [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> extentSpecBreadth: breadthSpec lengthSpec: lengthSpec [
	^ self subclassResponsibility
]

{ #category : #testing }
TbLinearLayoutOrientation >> isHorizontal [
	^ false
]

{ #category : #testing }
TbLinearLayoutOrientation >> isVertical [
	^ false
]

{ #category : #accessing }
TbLinearLayoutOrientation >> layout [
	^ layout
]

{ #category : #layout }
TbLinearLayoutOrientation >> layout: anElement in: aRectangle [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> lengthLinearProperties: anElement [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> lengthMode [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> lengthProperties: anElement [
	^ self subclassResponsibility
]

{ #category : #layout }
TbLinearLayoutOrientation >> lengthSpec [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> lengthSpec: anExtentSpec [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> marginBreadth: anElement [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> marginLength: anElement [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> measureChildWithMargin: child parentSpec: anExtentMeasurementSpec breadthUsed: breadthUsed lengthUsed: lengthUsed [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> measuredBreadth: anElement [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> measuredLength: anElement [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> minimalBreadth: anElement [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> minimalLength: anElement [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> paddingBreadth: anElement [
	^ self subclassResponsibility
]

{ #category : #orientation }
TbLinearLayoutOrientation >> paddingLength: anElement [
	^ self subclassResponsibility
]
