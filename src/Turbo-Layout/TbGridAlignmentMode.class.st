Class {
	#name : #TbGridAlignmentMode,
	#superclass : #Object,
	#classVars : [
		'ALIGN_BOUNDS',
		'ALIGN_MARGINS'
	],
	#category : #'Turbo-Layout-Grid-Utilities'
}

{ #category : #'alignment modes' }
TbGridAlignmentMode class >> alignBounds [
	^ ALIGN_BOUNDS
]

{ #category : #'alignment modes' }
TbGridAlignmentMode class >> alignMargins [
	^ ALIGN_MARGINS
]

{ #category : #'class initialization' }
TbGridAlignmentMode class >> initialize [
	super initialize.
	
	ALIGN_MARGINS := BlGridAlignMarginsMode new.
	ALIGN_BOUNDS := BlGridAlignBoundsMode new
]

{ #category : #comparing }
TbGridAlignmentMode >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : #testing }
TbGridAlignmentMode >> isAlignBounds [
	^ false
]

{ #category : #testing }
TbGridAlignmentMode >> isAlignMargins [
	^ false
]

{ #category : #'computing margins' }
TbGridAlignmentMode >> marginOf: anChildElement in: aGridLayout isHorizontal: isHorizontal isLeading: isLeading [
	^ self subclassResponsibility
]
