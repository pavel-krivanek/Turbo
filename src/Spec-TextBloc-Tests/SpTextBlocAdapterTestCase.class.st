Class {
	#name : #SpTextBlocAdapterTestCase,
	#superclass : #SpBaseTest,
	#instVars : [
		'app'
	],
	#category : #'Spec-TextBloc-Tests'
}

{ #category : #testing }
SpTextBlocAdapterTestCase class >> isAbstract [

	^ super isAbstract or: [ self = SpTextBlocAdapterTestCase ]
]

{ #category : #accessing }
SpTextBlocAdapterTestCase >> adapter [ 

	^ presenter adapter
]

{ #category : #accessing }
SpTextBlocAdapterTestCase >> initializeTestedInstance [
	super initializeTestedInstance.

	presenter application: app.
]

{ #category : #accessing }
SpTextBlocAdapterTestCase >> runCaseManaged [
	
	app := SpApplication new.
	app useBackend: #TextBloc.
	
	[ super runCaseManaged  ] ensure: [ app:= nil ].
]
