Class {
	#name : 'TbFlowLayoutRightToLeft',
	#superclass : 'TbFlowLayoutDirection',
	#category : 'Turbo-Layout-Flow-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Flow-Utilities'
}

{ #category : 'testing' }
TbFlowLayoutRightToLeft >> isLeftToRight [
	^ false
]

{ #category : 'testing' }
TbFlowLayoutRightToLeft >> isRightToLeft [
	^ true
]
