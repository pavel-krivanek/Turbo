Class {
	#name : #TbAbstractBuilder,
	#superclass : #Object,
	#instVars : [
		'canvas'
	],
	#category : #'Turbo-Canvas'
}

{ #category : #accessing }
TbAbstractBuilder >> canvas [
	^ canvas
]

{ #category : #accessing }
TbAbstractBuilder >> canvas: aCanvas [
	canvas := aCanvas
]

{ #category : #'initialize-release' }
TbAbstractBuilder >> reset [
	canvas := nil
]
