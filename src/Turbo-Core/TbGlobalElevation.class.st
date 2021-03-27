"
I represent a global element elevation given in Space coordinate system.
"
Class {
	#name : #TbGlobalElevation,
	#superclass : #TbElevation,
	#classInstVars : [
		'zero'
	],
	#category : #'Turbo-Core-Basic-Properties'
}

{ #category : #cleanup }
TbGlobalElevation class >> cleanUp [
	super cleanUp.
	
	zero := nil
]

{ #category : #'instance creation' }
TbGlobalElevation class >> zero [
	<return: #BlGlobalElevation>

	^ zero ifNil: [ zero := self elevation: 0 ]
]

{ #category : #accessing }
TbGlobalElevation >> relatedTo: aNumber [
	"Global elevation is constant"
	<return: #Number>

	^ self elevation
]
