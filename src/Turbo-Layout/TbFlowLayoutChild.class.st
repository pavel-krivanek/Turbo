Class {
	#name : 'TbFlowLayoutChild',
	#superclass : 'Object',
	#instVars : [
		'width',
		'height',
		'margin',
		'weight',
		'newLine',
		'startLength',
		'startBreadth',
		'element',
		'alignment',
		'measurer',
		'display'
	],
	#category : 'Turbo-Layout-Flow-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Flow-Utilities'
}

{ #category : 'instance creation' }
TbFlowLayoutChild class >> measurer: aMeasurer element: aChildElement [
	^ self new
		measurer: aMeasurer element: aChildElement;
		yourself
]

{ #category : 'adding' }
TbFlowLayoutChild >> addToLine: aLine [
	self subclassResponsibility
]

{ #category : 'accessing' }
TbFlowLayoutChild >> alignment [
	^ alignment
]

{ #category : 'accessing' }
TbFlowLayoutChild >> alignment: anAlignment [
	alignment := anAlignment
]

{ #category : 'geometry' }
TbFlowLayoutChild >> breadth [
	^ self orientation breadthOf: self
]

{ #category : 'accessing' }
TbFlowLayoutChild >> direction [
	^ measurer direction
]

{ #category : 'accessing' }
TbFlowLayoutChild >> display [
	^ display
]

{ #category : 'accessing' }
TbFlowLayoutChild >> display: aDisplay [
	"float or inline"
	display := aDisplay
]

{ #category : 'accessing' }
TbFlowLayoutChild >> element [
	^ element
]

{ #category : 'geometry' }
TbFlowLayoutChild >> height [
	^ height
]

{ #category : 'geometry' }
TbFlowLayoutChild >> height: aNumber [
	height := aNumber
]

{ #category : 'geometry' }
TbFlowLayoutChild >> inlineX [
	^ self orientation inlineX: self
]

{ #category : 'geometry' }
TbFlowLayoutChild >> inlineY [
	^ self orientation inlineY: self
]

{ #category : 'testing' }
TbFlowLayoutChild >> isFloating [
	^ display isFloating
]

{ #category : 'testing' }
TbFlowLayoutChild >> isInline [
	^ display isInline
]

{ #category : 'testing' }
TbFlowLayoutChild >> isNewLine [
	^ newLine
]

{ #category : 'geometry' }
TbFlowLayoutChild >> length [
	^ self orientation lengthOf: self
]

{ #category : 'accessing' }
TbFlowLayoutChild >> margin [
	^ margin
]

{ #category : 'accessing' }
TbFlowLayoutChild >> margin: aMargin [
	margin := aMargin
]

{ #category : 'accessing' }
TbFlowLayoutChild >> marginBottom [
	^ margin bottom
]

{ #category : 'accessing' }
TbFlowLayoutChild >> marginLeft [
	^ margin left
]

{ #category : 'accessing' }
TbFlowLayoutChild >> marginRight [
	^ margin right
]

{ #category : 'accessing' }
TbFlowLayoutChild >> marginTop [
	^ margin top
]

{ #category : 'initialization' }
TbFlowLayoutChild >> measurer: aMeasurer element: aChildElement [
	measurer := aMeasurer.
	element := aChildElement
]

{ #category : 'accessing' }
TbFlowLayoutChild >> newLine: aBoolean [
	newLine := aBoolean
]

{ #category : 'accessing' }
TbFlowLayoutChild >> orientation [
	^ measurer orientation
]

{ #category : 'geometry' }
TbFlowLayoutChild >> spacingBreadth [
	^ self orientation spacingBreadthOf: self
]

{ #category : 'geometry' }
TbFlowLayoutChild >> spacingLength [
	^ self orientation spacingLengthOf: self
]

{ #category : 'accessing' }
TbFlowLayoutChild >> startBreadth [
	^ startBreadth
]

{ #category : 'accessing' }
TbFlowLayoutChild >> startBreadth: aNumber [
	startBreadth := aNumber
]

{ #category : 'accessing' }
TbFlowLayoutChild >> startLength [
	^ startLength
]

{ #category : 'accessing' }
TbFlowLayoutChild >> startLength: aNumber [
	startLength := aNumber
]

{ #category : 'geometry' }
TbFlowLayoutChild >> totalBreadth [
	^ self breadth + self spacingBreadth
]

{ #category : 'geometry' }
TbFlowLayoutChild >> totalLength [
	^ self length + self spacingLength
]

{ #category : 'accessing' }
TbFlowLayoutChild >> weight [
	^ weight
]

{ #category : 'accessing' }
TbFlowLayoutChild >> weight: aNumber [
	weight := aNumber
]

{ #category : 'geometry' }
TbFlowLayoutChild >> width [
	^ width
]

{ #category : 'geometry' }
TbFlowLayoutChild >> width: aNumber [
	width := aNumber
]
