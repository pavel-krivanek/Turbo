Class {
	#name : #TbFlowLayoutVertical,
	#superclass : #TbFlowLayoutOrientation,
	#category : #'Turbo-Layout-Flow-Utilities'
}

{ #category : #measuring }
TbFlowLayoutVertical >> breadthModeOf: aMeasurer [
	^ aMeasurer widthMode
]

{ #category : #measuring }
TbFlowLayoutVertical >> breadthOf: aChild [
	^ aChild width
]

{ #category : #measuring }
TbFlowLayoutVertical >> breadthOf: aChild set: aNumber [
	aChild width: aNumber
]

{ #category : #measuring }
TbFlowLayoutVertical >> inlineX: aChild [
	^ aChild startBreadth
]

{ #category : #measuring }
TbFlowLayoutVertical >> inlineY: aChild [
	^ aChild startLength
]

{ #category : #testing }
TbFlowLayoutVertical >> isVertical [
	^ true
]

{ #category : #measuring }
TbFlowLayoutVertical >> lengthModeOf: aMeasurer [
	^ aMeasurer heightMode
]

{ #category : #measuring }
TbFlowLayoutVertical >> lengthOf: aChild [
	^ aChild height
]

{ #category : #measuring }
TbFlowLayoutVertical >> lengthOf: aChild set: aNumber [
	aChild height: aNumber
]

{ #category : #measuring }
TbFlowLayoutVertical >> lineX: aLine [
	^ aLine startBreadth
]

{ #category : #measuring }
TbFlowLayoutVertical >> lineY: aLine [
	^ aLine startLength
]

{ #category : #measuring }
TbFlowLayoutVertical >> maxBreadthOf: aMeasurer [
	^ aMeasurer maxWidth
]

{ #category : #measuring }
TbFlowLayoutVertical >> maxLengthOf: aMeasurer [
	^ aMeasurer maxHeight
]

{ #category : #measuring }
TbFlowLayoutVertical >> spacingBreadthOf: aChild [
	^ aChild marginLeft + aChild marginRight
]

{ #category : #measuring }
TbFlowLayoutVertical >> spacingLengthOf: aChild [
	^ aChild marginTop + aChild marginBottom
]
