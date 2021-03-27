Class {
	#name : #TbLayoutCommonConstraintsAxis,
	#superclass : #TbLayoutConstraintsAxis,
	#instVars : [
		'resizer'
	],
	#category : #'Turbo-Core-Layouts-Basic'
}

{ #category : #resizing }
TbLayoutCommonConstraintsAxis >> exact: aNumber [
	self resizer: (BlLayoutResizer exact: aNumber)
]

{ #category : #resizing }
TbLayoutCommonConstraintsAxis >> fitContent [
	self resizer: BlLayoutResizer fitContent
]

{ #category : #resizing }
TbLayoutCommonConstraintsAxis >> fitContentLimited [
	self resizer: BlLayoutResizer fitContentLimited
]

{ #category : #initialization }
TbLayoutCommonConstraintsAxis >> initialize [
	super initialize.
	
	resizer := BlLayoutResizer exact: 50
]

{ #category : #resizing }
TbLayoutCommonConstraintsAxis >> matchParent [
	self resizer: BlLayoutResizer matchParent
]

{ #category : #accessing }
TbLayoutCommonConstraintsAxis >> resizer [
	<return: #BlLayoutResizer>

	^ resizer
]

{ #category : #accessing }
TbLayoutCommonConstraintsAxis >> resizer: aBlLayoutResizer [
	resizer := aBlLayoutResizer
]
