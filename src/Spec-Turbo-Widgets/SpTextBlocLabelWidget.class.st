Class {
	#name : #SpTextBlocLabelWidget,
	#superclass : #SpTextBlocWidget,
	#instVars : [
		'label'
	],
	#category : #'Spec-Turbo-Widgets'
}

{ #category : #'as yet unclassified' }
SpTextBlocLabelWidget >> drawOnTextBlocCanvas: aCanvas [

	aCanvas at: 1@1 write: self label
]

{ #category : #accessing }
SpTextBlocLabelWidget >> label [
	^ label
]

{ #category : #accessing }
SpTextBlocLabelWidget >> label: anObject [
	label := anObject
]
