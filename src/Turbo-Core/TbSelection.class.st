"
I represent a text selection defined as interval [from...to]
"
Class {
	#name : 'TbSelection',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#classInstVars : [
		'empty'
	],
	#category : 'Turbo-Core-Utilities - Selection',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Selection'
}

{ #category : 'cleanup' }
TbSelection class >> cleanUp [
	super cleanUp.
	
	empty := nil
]

{ #category : 'instance creation' }
TbSelection class >> empty [
	^ empty ifNil: [ empty := TbEmptySelection new ]
]

{ #category : 'instance creation' }
TbSelection class >> from: aFromIndex to: aToIndex [
	^ TbMonotoneSelection from: aFromIndex to: aToIndex
]

{ #category : 'arithmetic' }
TbSelection >> + aTextSelection [
	^ TbMultipleSelection withAll: { self . aTextSelection }
]

{ #category : 'accessing' }
TbSelection >> allSelections [
	"Return a collection of all monotone selection intervals within this selection"
	<return: #Collection of: #BlMonotoneSelection>
	
	^ Array streamContents: [ :aStream | self do: [ :aSelection | aStream nextPut: aSelection ] ]
]

{ #category : 'api - enumerating' }
TbSelection >> anySatisfy: aBlock [
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns true for any element return true.
	Otherwise return false."

	self do: [:each | (aBlock value: each) ifTrue: [ ^ true ] ].
	^ false
]

{ #category : 'accessing' }
TbSelection >> children [
	<return: #Collection of: #BlSelection>
	
	^ self subclassResponsibility
]

{ #category : 'api - testing' }
TbSelection >> contains: anIndex [
	"Return true if this selection interval includes a given index, false otherwise"
	<return: #Boolean>
	
	^ self subclassResponsibility
]

{ #category : 'api - enumerating' }
TbSelection >> do: aBlock [
	"Evaluate a given block with all recorded selection intervals"
	
	self subclassResponsibility
]

{ #category : 'api - testing' }
TbSelection >> isEmpty [
	^ self subclassResponsibility
]

{ #category : 'api - testing' }
TbSelection >> isNotEmpty [
	^ self subclassResponsibility
]

{ #category : 'api - enumerating' }
TbSelection >> reverseDo: aBlock [
	"Evaluate a given block with all recorded selection intervals in reverse direction"

	self subclassResponsibility
]
