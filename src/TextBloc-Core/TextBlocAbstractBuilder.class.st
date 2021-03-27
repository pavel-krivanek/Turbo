Class {
	#name : #TextBlocAbstractBuilder,
	#superclass : #Object,
	#instVars : [
		'canvas'
	],
	#category : #'TextBloc-Core'
}

{ #category : #accessing }
TextBlocAbstractBuilder >> canvas [
	^ canvas
]

{ #category : #accessing }
TextBlocAbstractBuilder >> canvas: aCanvas [
	canvas := aCanvas
]

{ #category : #'initialize-release' }
TextBlocAbstractBuilder >> reset [
	canvas := nil
]
