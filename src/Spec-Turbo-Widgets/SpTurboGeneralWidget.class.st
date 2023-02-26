Class {
	#name : #SpTurboGeneralWidget,
	#superclass : #SpTurboWidget,
	#instVars : [
		'name'
	],
	#category : #'Spec-Turbo-Widgets'
}

{ #category : #'instance creation' }
SpTurboGeneralWidget class >> named: aString [

	^ self new name: aString;
		yourself
]

{ #category : #accessing }
SpTurboGeneralWidget >> drawOnTurboCanvas: aCanvas [

	super drawOnTurboCanvas: aCanvas. 
	
	aCanvas at: 3@1 write: self name
]

{ #category : #accessing }
SpTurboGeneralWidget >> name [
	^ name
]

{ #category : #accessing }
SpTurboGeneralWidget >> name: anObject [
	name := anObject
]
