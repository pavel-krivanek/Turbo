Class {
	#name : 'TbLinearLayoutNode',
	#superclass : 'Object',
	#instVars : [
		'element',
		'orientation',
		'linearConstraints'
	],
	#category : 'Turbo-Layout-Linear-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Linear-Utilities'
}

{ #category : 'accessing - constraints' }
TbLinearLayoutNode >> breadthConstraints [
	^ self orientation breadthProperties: self element
]

{ #category : 'accessing - properties' }
TbLinearLayoutNode >> breadthResizer [
	^ self breadthConstraints resizer
]

{ #category : 'accessing' }
TbLinearLayoutNode >> constraints [
	^ self element constraints
]

{ #category : 'accessing' }
TbLinearLayoutNode >> element [
	<return: #BlElement>

	^ element
]

{ #category : 'testing' }
TbLinearLayoutNode >> hasSpaceAfter [
	"Return true if there should be a divider after this node"
	<return: #Boolean>

	^ true
]

{ #category : 'testing' }
TbLinearLayoutNode >> hasSpaceBefore [
	"Return true if there should be a divider before this node"
	<return: #Boolean>

	^ true
]

{ #category : 'initialization' }
TbLinearLayoutNode >> initializeWith: anElement orientation: aBlLinearLayoutOrientation [
	element := anElement.
	orientation := aBlLinearLayoutOrientation.
	linearConstraints := anElement constraints linear.
]

{ #category : 'accessing - constraints' }
TbLinearLayoutNode >> lengthConstraints [
	^ self orientation lengthProperties: self element
]

{ #category : 'accessing - properties' }
TbLinearLayoutNode >> lengthResizer [
	^ self lengthConstraints resizer
]

{ #category : 'accessing - properties' }
TbLinearLayoutNode >> lengthResizer: aResizer [
	self lengthConstraints resizer: aResizer
]

{ #category : 'accessing' }
TbLinearLayoutNode >> linearConstraints [
	<return: #BlLinearLayoutConstraints>

	^ linearConstraints
]

{ #category : 'accessing - properties' }
TbLinearLayoutNode >> marginBreadth [
	<return: #Number>

	^ self orientation marginBreadth: self element
]

{ #category : 'accessing - properties' }
TbLinearLayoutNode >> marginLength [
	<return: #Number>

	^ self orientation marginLength: self element
]

{ #category : 'measure' }
TbLinearLayoutNode >> measure: anExtentSpec [
	self element measure: anExtentSpec
]

{ #category : 'accessing - properties' }
TbLinearLayoutNode >> measuredBreadth [
	^ self orientation measuredBreadth: self element
]

{ #category : 'accessing - properties' }
TbLinearLayoutNode >> measuredLength [
	^ self orientation measuredLength: self element
]

{ #category : 'accessing' }
TbLinearLayoutNode >> orientation [
	<return: #BlLinearLayoutOrientation>

	^ orientation
]

{ #category : 'testing' }
TbLinearLayoutNode >> shouldUseExcessSpace [
	<return: #Boolean>

	^ self weight > 0
]

{ #category : 'accessing - properties' }
TbLinearLayoutNode >> verticalAlignment [
	^ self linearConstraints vertical alignment
]

{ #category : 'accessing - properties' }
TbLinearLayoutNode >> weight [
	"Weight is only applicable if a child matches parent"
	<return: #Number>

	^ self lengthResizer isMatchParent
		ifTrue: [ self linearConstraints weight ]
		ifFalse: [ 0 ]
]
