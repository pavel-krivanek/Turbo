Class {
	#name : 'TbFlowLayoutDirection',
	#superclass : 'Object',
	#category : 'Turbo-Layout-Flow-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Flow-Utilities'
}

{ #category : 'testing' }
TbFlowLayoutDirection >> isLeftToRight [
	^ self subclassResponsibility
]

{ #category : 'testing' }
TbFlowLayoutDirection >> isRightToLeft [
	^ self subclassResponsibility
]
