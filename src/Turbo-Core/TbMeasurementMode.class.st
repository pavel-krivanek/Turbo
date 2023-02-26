"
I describe a mode of measurement specification. There are three modes which are my subclasses:
 - at most, meaning that element is allowed to be at most of specified size
 - exact, meaning that element should have exact size provided in specification
 - unspecified, meaning that we still can say anything how big an element should be. Maybe its size depends on children or parent, so we need first to find sizes of dependent element and then come back

Generally I represent an internal class which in most cases should not used directly by user or developers of custom layout strategies.

My main methods are
 - measurement: aResizing with: aNumber to determine which measurement spec should be used to measure children based on their resizing property and possible size provided by parent. It uses double dispatch (BlMeasurementMode <-> BlLayoutResizing)
 - sizeFor: aNumber. find out the final value for the size of element based on provided possible size with single dispatching to my subclasses
"
Class {
	#name : #TbMeasurementMode,
	#superclass : #Object,
	#classInstVars : [
		'atMost',
		'exact',
		'unspecified'
	],
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #accessing }
TbMeasurementMode class >> atMost [
	<return: #BlMeasurementMode>

	^ atMost ifNil: [ atMost := TbMeasurementAtMostMode new ]
]

{ #category : #cleanup }
TbMeasurementMode class >> cleanUp [
	super cleanUp.
	
	atMost := nil.
	exact := nil.
	unspecified := nil
]

{ #category : #accessing }
TbMeasurementMode class >> exact [
	<return: #BlMeasurementMode>
	
	^ exact ifNil: [ exact := TbMeasurementExactMode new ]
]

{ #category : #accessing }
TbMeasurementMode class >> unspecified [
	<return: #BlMeasurementMode>
	
	^ unspecified ifNil: [ unspecified := TbMeasurementUnspecifiedMode new ]
]

{ #category : #comparing }
TbMeasurementMode >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	^ anotherObject class == self class
]

{ #category : #comparing }
TbMeasurementMode >> hash [
	^ self class hash
]

{ #category : #testing }
TbMeasurementMode >> isAtMost [
	^ false
]

{ #category : #testing }
TbMeasurementMode >> isExact [
	^ false
]

{ #category : #testing }
TbMeasurementMode >> isUnspecified [
	^ false
]

{ #category : #geometry }
TbMeasurementMode >> measurement: aResizing with: aNumber [
	<return: #BlMeasurementSpec>
	
	^ self subclassResponsibility
]

{ #category : #printing }
TbMeasurementMode >> printOn: aStream size: aNumber [
	"Prints measurement mode with taking a given size into account"
	self subclassResponsibility
]

{ #category : #geometry }
TbMeasurementMode >> size: aNumber with: aSpecSize [
	<return: #aNumber>
	
	^ self subclassResponsibility
]
