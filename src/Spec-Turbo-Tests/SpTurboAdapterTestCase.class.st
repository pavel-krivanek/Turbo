Class {
	#name : #SpTurboAdapterTestCase,
	#superclass : #SpBaseTest,
	#instVars : [
		'app'
	],
	#category : #'Spec-Turbo-Tests'
}

{ #category : #testing }
SpTurboAdapterTestCase class >> isAbstract [

	^ super isAbstract or: [ self = SpTurboAdapterTestCase ]
]

{ #category : #accessing }
SpTurboAdapterTestCase >> adapter [ 

	^ presenter adapter
]

{ #category : #accessing }
SpTurboAdapterTestCase >> initializeTestedInstance [
	super initializeTestedInstance.

	presenter application: app.
]

{ #category : #accessing }
SpTurboAdapterTestCase >> runCaseManaged [
	
	app := SpApplication new.
	app useBackend: #Turbo.
	
	[ super runCaseManaged  ] ensure: [ app:= nil ].
]
