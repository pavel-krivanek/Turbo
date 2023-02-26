"
! Element change logger and processor

I log changes of various element properties during one frame.

 
"
Class {
	#name : #TbElementChanges,
	#superclass : #Object,
	#instVars : [
		'extentChange',
		'positionChange'
	],
	#category : #'Turbo-Core-Basic-Changes'
}

{ #category : #enumeration }
TbElementChanges >> changes [
	"Return a collection of all changes"
	<return: #Array of: #BlElementChange>
	
	^ { positionChange . extentChange }
]

{ #category : #enumeration }
TbElementChanges >> changesDo: aBlock [
	"Evaluate a given block with every existing change as an argument"
	
	aBlock value: positionChange.
	aBlock value: extentChange
]

{ #category : #committing }
TbElementChanges >> commitOn: anElement [
	"Commit all accumulated changes done to the given element.
	As the result, all changes are marked as comitted"

	self changesDo: [ :aChange | aChange commitOn: anElement ]
]

{ #category : #'api - changes' }
TbElementChanges >> extentChange: anOldExtent to: aNewExtent [
	"Log the extent change of the element"

	extentChange old: anOldExtent new: aNewExtent
]

{ #category : #initialization }
TbElementChanges >> initialize [
	super initialize.
	
	extentChange := TbElementExtentChange new.
	positionChange := TbElementPositionChange new
]

{ #category : #testing }
TbElementChanges >> isExtentChanged [
	<return: #Boolean>

	^ extentChange hasActiveChanges
]

{ #category : #testing }
TbElementChanges >> isPositionChanged [
	<return: #Boolean>

	^ positionChange hasActiveChanges
]

{ #category : #'api - changes' }
TbElementChanges >> positionChange: anOldPosition to: aNewPosition [
	"Log the position change of the element"

	positionChange old: anOldPosition new: aNewPosition
]
