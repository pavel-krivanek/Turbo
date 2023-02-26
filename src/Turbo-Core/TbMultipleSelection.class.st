"
I am just a collection of independent text selections that may overlap.
"
Class {
	#name : #TbMultipleSelection,
	#superclass : #TbSelection,
	#instVars : [
		'selections'
	],
	#category : #'Turbo-Core-Utilities - Selection'
}

{ #category : #'instance creation' }
TbMultipleSelection class >> withAll: aCollectionOfSelections [

	^ self new withAll: aCollectionOfSelections
]

{ #category : #arithmetic }
TbMultipleSelection >> + aSelection [
	^ self add: aSelection
]

{ #category : #adding }
TbMultipleSelection >> add: aSelection [
	selections add: aSelection
]

{ #category : #accessing }
TbMultipleSelection >> children [
	<return: #Collection of: #BlSelection>
	
	^ selections
]

{ #category : #'api - testing' }
TbMultipleSelection >> contains: anIndex [
	"Return true if this selection interval includes a given index, false otherwise"
	<return: #Boolean>
	
	^ selections anySatisfy: [ :eachSelection | 
		eachSelection contains: anIndex ]
]

{ #category : #'api - enumerating' }
TbMultipleSelection >> do: aBlock [
	selections do: [ :aSelection | aSelection do: aBlock ]
]

{ #category : #accessing }
TbMultipleSelection >> from [
	"Return a text index of the first selected character"
	<return: #Number>

	^ ((self selections select: [ :each | each isNotEmpty ])
		detectMin: [ :each | each from ]) from
]

{ #category : #'api - testing' }
TbMultipleSelection >> includes: anIndex [
	"Return true if this selection interval includes a given index, false otherwise"
	<return: #Boolean>
	
	^ self subclassResponsibility
]

{ #category : #initialization }
TbMultipleSelection >> initialize [
	super initialize.
	
	selections := OrderedCollection new
]

{ #category : #'api - testing' }
TbMultipleSelection >> isEmpty [
	^ selections allSatisfy: #isEmpty
]

{ #category : #'api - testing' }
TbMultipleSelection >> isNotEmpty [
	^ selections anySatisfy: #isNotEmpty
]

{ #category : #'api - enumerating' }
TbMultipleSelection >> reverseDo: aBlock [
	"Evaluate a given block with all recorded selection intervals in reverse direction"

	selections reverseDo: [ :aSelection | aSelection do: aBlock ]
]

{ #category : #accessing }
TbMultipleSelection >> selections [
	<return: #Collection of: #BlSelection>

	^ selections
]

{ #category : #accessing }
TbMultipleSelection >> to [
	"Return a text index of the last selected character"
	<return: #Number>

	^ ((self selections select: [ :each | each isNotEmpty ])
			detectMax: [ :each | each to ]) to
]

{ #category : #initialization }
TbMultipleSelection >> withAll: aCollectionOfSelections [
	selections addAll: aCollectionOfSelections
]
