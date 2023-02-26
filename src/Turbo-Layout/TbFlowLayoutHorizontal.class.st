Class {
	#name : #TbFlowLayoutHorizontal,
	#superclass : #TbFlowLayoutOrientation,
	#category : #'Turbo-Layout-Flow-Utilities'
}

{ #category : #measuring }
TbFlowLayoutHorizontal >> breadthModeOf: aMeasurer [
	^ aMeasurer heightMode
]

{ #category : #measuring }
TbFlowLayoutHorizontal >> breadthOf: aChild [
	^ aChild height
]

{ #category : #measuring }
TbFlowLayoutHorizontal >> breadthOf: aChild set: aNumber [
	aChild height: aNumber
]

{ #category : #measuring }
TbFlowLayoutHorizontal >> inlineX: aChild [
	^ aChild startLength
]

{ #category : #measuring }
TbFlowLayoutHorizontal >> inlineY: aChild [
	^ aChild startBreadth
]

{ #category : #testing }
TbFlowLayoutHorizontal >> isHorizontal [
	^ true
]

{ #category : #measuring }
TbFlowLayoutHorizontal >> lengthModeOf: aMeasurer [
	^ aMeasurer widthMode
]

{ #category : #measuring }
TbFlowLayoutHorizontal >> lengthOf: aChild [
	^ aChild width
]

{ #category : #measuring }
TbFlowLayoutHorizontal >> lengthOf: aChild set: aNumber [
	aChild width: aNumber
]

{ #category : #measuring }
TbFlowLayoutHorizontal >> lineX: aLine [
	^ aLine startLength
]

{ #category : #measuring }
TbFlowLayoutHorizontal >> lineY: aLine [
	^ aLine startBreadth
]

{ #category : #measuring }
TbFlowLayoutHorizontal >> maxBreadthOf: aMeasurer [
	^ aMeasurer maxHeight
]

{ #category : #measuring }
TbFlowLayoutHorizontal >> maxLengthOf: aMeasurer [
	^ aMeasurer maxWidth
]

{ #category : #measuring }
TbFlowLayoutHorizontal >> spacingBreadthOf: aChild [
	^ aChild marginTop + aChild marginBottom
]

{ #category : #measuring }
TbFlowLayoutHorizontal >> spacingLengthOf: aChild [
	^ aChild marginLeft + aChild marginRight
]
