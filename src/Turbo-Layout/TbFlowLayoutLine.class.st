Class {
	#name : 'TbFlowLayoutLine',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'children',
		'startLength',
		'startBreadth',
		'length',
		'breadth',
		'measurer',
		'index'
	],
	#category : 'Turbo-Layout-Flow-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Flow-Utilities'
}

{ #category : 'instance creation' }
TbFlowLayoutLine class >> for: aMeasurer [
	^ self new
		measurer: aMeasurer;
		yourself
]

{ #category : 'adding' }
TbFlowLayoutLine >> addFloatFirst: aChild [
	self
		assert: [ aChild isFloating ]
		description: [ 'I can only be used to add floating children!' ].

	children addFirst: aChild.
	
	length := length + aChild length + aChild spacingLength
]

{ #category : 'adding' }
TbFlowLayoutLine >> addFloatLast: aChild [
	self
		assert: [ aChild isFloating ]
		description: [ 'I can only be used to add floating children!' ].

	children addLast: aChild.
	
	length := length + aChild length + aChild spacingLength
]

{ #category : 'adding' }
TbFlowLayoutLine >> addInlineFirst: aChild [
	self
		assert: [ aChild isInline ]
		description: [ 'I can only be used to add inlined children!' ].

	children addFirst: aChild.
	
	length := length + aChild length + aChild spacingLength.
	breadth := breadth max: aChild breadth + aChild spacingBreadth
]

{ #category : 'adding' }
TbFlowLayoutLine >> addInlineLast: aChild [
	self
		assert: [ aChild isInline ]
		description: [ 'I can only be used to add inlined children!' ].

	children addLast: aChild.
	
	length := length + aChild length + aChild spacingLength.
	breadth := breadth max: aChild breadth + aChild spacingBreadth
]

{ #category : 'adding' }
TbFlowLayoutLine >> addTo: theLines [
	"I dispatch to concreate addFirst/addLast based on layout configuration"
	(self orientation isVertical and: [ self direction isRightToLeft ])
		ifTrue: [ theLines addFirst: self ]
		ifFalse: [ theLines addLast: self ].
	index := theLines size
]

{ #category : 'geometry' }
TbFlowLayoutLine >> breadth [
	^ breadth
]

{ #category : 'geometry' }
TbFlowLayoutLine >> breadth: aNumber [
	breadth := aNumber
]

{ #category : 'testing' }
TbFlowLayoutLine >> canFit: aChild [
	^ self length + aChild length + aChild spacingLength <= measurer maxLength
]

{ #category : 'accessing' }
TbFlowLayoutLine >> children [
	^ children
]

{ #category : 'accessing' }
TbFlowLayoutLine >> direction [
	^ measurer direction
]

{ #category : 'accessing' }
TbFlowLayoutLine >> index [
	^ index
]

{ #category : 'accessing' }
TbFlowLayoutLine >> index: anIndex [
	index := anIndex
]

{ #category : 'initialization' }
TbFlowLayoutLine >> initialize [
	super initialize.
	
	children := OrderedCollection new.
	startBreadth := 0.
	startLength := 0.
	length := 0.
	breadth := 0.
	
	"initialized by layoutSpec:"
	measurer := nil
]

{ #category : 'testing' }
TbFlowLayoutLine >> isEmpty [
	^ children isEmpty
]

{ #category : 'geometry' }
TbFlowLayoutLine >> length [
	^ length
]

{ #category : 'geometry' }
TbFlowLayoutLine >> length: aNumber [
	length := aNumber
]

{ #category : 'geometry' }
TbFlowLayoutLine >> lineX [
	^ self orientation lineX: self
]

{ #category : 'geometry' }
TbFlowLayoutLine >> lineY [
	^ self orientation lineY: self
]

{ #category : 'initialization' }
TbFlowLayoutLine >> measurer: aMeasurer [
	measurer := aMeasurer
]

{ #category : 'accessing' }
TbFlowLayoutLine >> orientation [
	^ measurer orientation
]

{ #category : 'accessing' }
TbFlowLayoutLine >> startBreadth [
	^ startBreadth
]

{ #category : 'accessing' }
TbFlowLayoutLine >> startBreadth: aNumber [
	startBreadth := aNumber
]

{ #category : 'accessing' }
TbFlowLayoutLine >> startLength [
	^ startLength
]

{ #category : 'accessing' }
TbFlowLayoutLine >> startLength: aNumber [
	startLength := aNumber
]
