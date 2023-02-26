"
I am an empty selection
"
Class {
	#name : #TbEmptySelection,
	#superclass : #TbSelection,
	#category : #'Turbo-Core-Utilities - Selection'
}

{ #category : #accessing }
TbEmptySelection >> children [
	<return: #Collection of: #BlSelection>
	
	^ #()
]

{ #category : #'api - testing' }
TbEmptySelection >> contains: anIndex [
	"Return true if this selection interval includes a given index, false otherwise"
	<return: #Boolean>
	
	^ false
]

{ #category : #'api - enumerating' }
TbEmptySelection >> do: aBlock [
	"Evaluate a given block with all recorded selection intervals"
]

{ #category : #'api - testing' }
TbEmptySelection >> isEmpty [
	^ true
]

{ #category : #'api - testing' }
TbEmptySelection >> isNotEmpty [
	^ self isEmpty not
]

{ #category : #'api - enumerating' }
TbEmptySelection >> reverseDo: aBlock [
	"Evaluate a given block with all recorded selection intervals in reverse direction"
]
