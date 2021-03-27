Class {
	#name : #TbFlowLayoutInline,
	#superclass : #TbFlowLayoutDisplay,
	#category : #'Turbo-Layout-Flow-Utilities'
}

{ #category : #testing }
TbFlowLayoutInline >> isFloating [
	^ false
]

{ #category : #testing }
TbFlowLayoutInline >> isInline [
	^ true
]
