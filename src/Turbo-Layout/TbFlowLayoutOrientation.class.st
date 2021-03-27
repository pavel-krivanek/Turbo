Class {
	#name : #TbFlowLayoutOrientation,
	#superclass : #Object,
	#category : #'Turbo-Layout-Flow-Utilities'
}

{ #category : #measuring }
TbFlowLayoutOrientation >> breadthModeOf: aMeasurer [
	^ self subclassResponsibility
]

{ #category : #measuring }
TbFlowLayoutOrientation >> breadthOf: aChild [
	^ self subclassResponsibility
]

{ #category : #measuring }
TbFlowLayoutOrientation >> breadthOf: aChild set: aNumber [
	^ self subclassResponsibility
]

{ #category : #measuring }
TbFlowLayoutOrientation >> inlineX: aChild [
	^ self subclassResponsibility
]

{ #category : #measuring }
TbFlowLayoutOrientation >> inlineY: aChild [
	^ self subclassResponsibility
]

{ #category : #testing }
TbFlowLayoutOrientation >> isHorizontal [
	^ false
]

{ #category : #testing }
TbFlowLayoutOrientation >> isVertical [
	^ false
]

{ #category : #measuring }
TbFlowLayoutOrientation >> lengthModeOf: aMeasurer [
	^ self subclassResponsibility
]

{ #category : #measuring }
TbFlowLayoutOrientation >> lengthOf: aChild [
	^ self subclassResponsibility
]

{ #category : #measuring }
TbFlowLayoutOrientation >> lengthOf: aChild set: aNumber [
	^ self subclassResponsibility
]

{ #category : #measuring }
TbFlowLayoutOrientation >> lineX: aChild [
	^ self subclassResponsibility
]

{ #category : #measuring }
TbFlowLayoutOrientation >> lineY: aChild [
	^ self subclassResponsibility
]

{ #category : #measuring }
TbFlowLayoutOrientation >> maxBreadthOf: aMeasurer [
	^ self subclassResponsibility
]

{ #category : #measuring }
TbFlowLayoutOrientation >> maxLengthOf: aMeasurer [
	^ self subclassResponsibility
]

{ #category : #measuring }
TbFlowLayoutOrientation >> spacingBreadthOf: aChild [
	^ self subclassResponsibility
]

{ #category : #measuring }
TbFlowLayoutOrientation >> spacingLengthOf: aChild [
	^ self subclassResponsibility
]
