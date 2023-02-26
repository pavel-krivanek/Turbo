Class {
	#name : #TbFlowLayoutFloat,
	#superclass : #TbFlowLayoutDisplay,
	#category : #'Turbo-Layout-Flow-Utilities'
}

{ #category : #testing }
TbFlowLayoutFloat >> isFloating [
	^ true
]

{ #category : #testing }
TbFlowLayoutFloat >> isInline [
	^ false
]
