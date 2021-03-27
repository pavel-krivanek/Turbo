Class {
	#name : #TbFlowLayoutConstraints,
	#superclass : #TbLayoutConstraints,
	#instVars : [
		'newLine',
		'weight',
		'display'
	],
	#category : #'Turbo-Layout-Flow'
}

{ #category : #accessing }
TbFlowLayoutConstraints >> alignment [
	^ self horizontal alignment + self vertical alignment
]

{ #category : #initialization }
TbFlowLayoutConstraints >> defaultDisplay [
	^ BlFlowLayoutDisplay inline
]

{ #category : #initialization }
TbFlowLayoutConstraints >> defaultHorizontal [
	^ BlFlowLayoutConstraintsHorizontal new
]

{ #category : #initialization }
TbFlowLayoutConstraints >> defaultVertical [
	^ BlFlowLayoutConstraintsVertical new
]

{ #category : #accessing }
TbFlowLayoutConstraints >> display [
	^ display
]

{ #category : #accessing }
TbFlowLayoutConstraints >> float [
	display := BlFlowLayoutDisplay float
]

{ #category : #initialization }
TbFlowLayoutConstraints >> initialize [
	super initialize.
	
	newLine := false.
	weight := 0.
	display := self defaultDisplay
]

{ #category : #accessing }
TbFlowLayoutConstraints >> inline [
	display := BlFlowLayoutDisplay inline
]

{ #category : #testing }
TbFlowLayoutConstraints >> isNewLine [
	^ newLine
]

{ #category : #accessing }
TbFlowLayoutConstraints >> newLine: aBoolean [
	newLine := aBoolean
]

{ #category : #accessing }
TbFlowLayoutConstraints >> weight [
	^ weight
]

{ #category : #accessing }
TbFlowLayoutConstraints >> weight: aNumber [
	weight := aNumber
]
