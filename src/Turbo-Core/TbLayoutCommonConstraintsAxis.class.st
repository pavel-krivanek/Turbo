Class {
	#name : 'TbLayoutCommonConstraintsAxis',
	#superclass : 'TbLayoutConstraintsAxis',
	#instVars : [
		'resizer'
	],
	#category : 'Turbo-Core-Layouts-Basic',
	#package : 'Turbo-Core',
	#tag : 'Layouts-Basic'
}

{ #category : 'resizing' }
TbLayoutCommonConstraintsAxis >> exact: aNumber [
	self resizer: (TbLayoutResizer exact: aNumber)
]

{ #category : 'resizing' }
TbLayoutCommonConstraintsAxis >> fitContent [
	self resizer: TbLayoutResizer fitContent
]

{ #category : 'resizing' }
TbLayoutCommonConstraintsAxis >> fitContentLimited [
	self resizer: TbLayoutResizer fitContentLimited
]

{ #category : 'initialization' }
TbLayoutCommonConstraintsAxis >> initialize [
	super initialize.
	
	resizer := TbLayoutResizer exact: 50
]

{ #category : 'resizing' }
TbLayoutCommonConstraintsAxis >> matchParent [
	self resizer: TbLayoutResizer matchParent
]

{ #category : 'accessing' }
TbLayoutCommonConstraintsAxis >> resizer [
	<return: #BlLayoutResizer>

	^ resizer
]

{ #category : 'accessing' }
TbLayoutCommonConstraintsAxis >> resizer: aBlLayoutResizer [
	resizer := aBlLayoutResizer
]
