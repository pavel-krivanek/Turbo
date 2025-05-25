Class {
	#name : 'TbFlowLayoutLeftToRight',
	#superclass : 'TbFlowLayoutDirection',
	#category : 'Turbo-Layout-Flow-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Flow-Utilities'
}

{ #category : 'testing' }
TbFlowLayoutLeftToRight >> isLeftToRight [
	^ true
]

{ #category : 'testing' }
TbFlowLayoutLeftToRight >> isRightToLeft [
	^ false
]
