Class {
	#name : #BlFlowLayoutDisplay,
	#superclass : #Object,
	#classInstVars : [
		'float',
		'inline'
	],
	#category : #'Turbo-Layout-Flow-Utilities'
}

{ #category : #factory }
BlFlowLayoutDisplay class >> float [
	^ float
]

{ #category : #'class initialization' }
BlFlowLayoutDisplay class >> initialize [
	super initialize.
	
	inline := BlFlowLayoutInline new.
	float := BlFlowLayoutFloat new
]

{ #category : #factory }
BlFlowLayoutDisplay class >> inline [
	^ inline
]

{ #category : #testing }
BlFlowLayoutDisplay >> isFloating [
	^ self subclassResponsibility
]

{ #category : #testing }
BlFlowLayoutDisplay >> isInline [
	^ self subclassResponsibility
]
