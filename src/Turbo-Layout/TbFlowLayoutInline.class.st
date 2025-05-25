Class {
	#name : 'TbFlowLayoutInline',
	#superclass : 'TbFlowLayoutDisplay',
	#category : 'Turbo-Layout-Flow-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Flow-Utilities'
}

{ #category : 'testing' }
TbFlowLayoutInline >> isFloating [
	^ false
]

{ #category : 'testing' }
TbFlowLayoutInline >> isInline [
	^ true
]
