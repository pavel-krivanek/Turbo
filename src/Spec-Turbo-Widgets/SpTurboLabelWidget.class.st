Class {
	#name : #SpTurboLabelWidget,
	#superclass : #SpTurboWidget,
	#instVars : [
		'label'
	],
	#category : #'Spec-Turbo-Widgets'
}

{ #category : #'as yet unclassified' }
SpTurboLabelWidget >> drawOnTurboCanvas: aCanvas [

	aCanvas at: 1@1 write: self label
]

{ #category : #accessing }
SpTurboLabelWidget >> label [
	^ label
]

{ #category : #accessing }
SpTurboLabelWidget >> label: anObject [
	label := anObject
]
