Class {
	#name : #SpTextBlocGeneralWidget,
	#superclass : #SpTextBlocWidget,
	#instVars : [
		'name'
	],
	#category : #'Spec-TextBlocAdapters-Widgets'
}

{ #category : #'instance creation' }
SpTextBlocGeneralWidget class >> named: aString [

	^ self new name: aString;
		yourself
]

{ #category : #accessing }
SpTextBlocGeneralWidget >> drawOnTextBlocCanvas: aCanvas [

	super drawOnTextBlocCanvas: aCanvas. 
	
	aCanvas at: 3@1 write: self name
]

{ #category : #accessing }
SpTextBlocGeneralWidget >> name [
	^ name
]

{ #category : #accessing }
SpTextBlocGeneralWidget >> name: anObject [
	name := anObject
]
