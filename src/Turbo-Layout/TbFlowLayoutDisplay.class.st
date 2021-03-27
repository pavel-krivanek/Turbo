Class {
	#name : #TbFlowLayoutDisplay,
	#superclass : #Object,
	#classInstVars : [
		'float',
		'inline'
	],
	#category : #'Turbo-Layout-Flow-Utilities'
}

{ #category : #factory }
TbFlowLayoutDisplay class >> float [
	^ float
]

{ #category : #'class initialization' }
TbFlowLayoutDisplay class >> initialize [
	super initialize.
	
	inline := TbFlowLayoutInline new.
	float := TbFlowLayoutFloat new
]

{ #category : #factory }
TbFlowLayoutDisplay class >> inline [
	^ inline
]

{ #category : #testing }
TbFlowLayoutDisplay >> isFloating [
	^ self subclassResponsibility
]

{ #category : #testing }
TbFlowLayoutDisplay >> isInline [
	^ self subclassResponsibility
]
