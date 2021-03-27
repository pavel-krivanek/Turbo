Class {
	#name : #TbLinearLayout,
	#superclass : #TbLayout,
	#traits : 'TTbAlignable',
	#classTraits : 'TTbAlignable classTrait',
	#instVars : [
		'weightSum',
		'verticalAlignment',
		'horizontalAlignment',
		'orientation',
		'shouldUseLargestChild',
		'cellSpacing'
	],
	#category : #'Turbo-Layout-Linear'
}

{ #category : #constraints }
TbLinearLayout class >> constraints [
	^ BlLinearLayoutConstraints new
]

{ #category : #factory }
TbLinearLayout class >> horizontal [
	^ self new beHorizontal
]

{ #category : #factory }
TbLinearLayout class >> vertical [
	^ self new beVertical
]

{ #category : #'api - alignment' }
TbLinearLayout >> align: aChildElement horizontal: aBlAlignment [
	aChildElement constraintsDo: [ :c | (c at: self class) horizontal alignment: aBlAlignment ]
]

{ #category : #'api - alignment' }
TbLinearLayout >> align: aChildElement vertical: aBlAlignment [
	aChildElement constraintsDo: [ :c | (c at: self class) vertical alignment: aBlAlignment ]
]

{ #category : #accessing }
TbLinearLayout >> alignment [
	^ (self horizontalAlignment + self verticalAlignment) directed: self direction
]

{ #category : #orientation }
TbLinearLayout >> beHorizontal [
	"Change my orientation to horizontal"
	
	self orientation: BlLinearLayoutHorizontalOrientation new
]

{ #category : #orientation }
TbLinearLayout >> beVertical [
	"Change my orientation to vertical"
	
	self orientation: BlLinearLayoutVerticalOrientation new
]

{ #category : #accessing }
TbLinearLayout >> cellSpacing [
	<return: #Number>
	
	^ cellSpacing
]

{ #category : #accessing }
TbLinearLayout >> cellSpacing: aNumber [	
	cellSpacing := aNumber
]

{ #category : #initialization }
TbLinearLayout >> defaultHorizontalAlignment [
	"By default alignment should not influence on layout process,
	so to not deal with nils use null object"
	<return: #BlNullAlignment>
	
	^ BlElementAlignment null horizontal
]

{ #category : #initialization }
TbLinearLayout >> defaultOrientation [
	"Return default orientation used by LinearLayout. If
	instance of my class is created with #new a horizontal orientation
	is used by defualt"
	<return: #BlLinearLayoutHorizontalOrientation>
	
	^ BlLinearLayoutHorizontalOrientation new
]

{ #category : #initialization }
TbLinearLayout >> defaultVerticalAlignment [
	"By default alignment should not influence on layout process,
	so to not deal with nils use null object"
	<return: #BlNullAlignment>
	
	^ BlElementAlignment null vertical
]

{ #category : #initialization }
TbLinearLayout >> defaultWeightSum [
	"Default weight sum should be 0 to indicate that actual weight should be calculated
	as arithmetic sum of childrens' weight"
	<return: #Number>
	
	^ 0
]

{ #category : #accessing }
TbLinearLayout >> horizontalAlignment [
	^ horizontalAlignment
]

{ #category : #accessing }
TbLinearLayout >> horizontalAlignment: anAlignment [
	horizontalAlignment := anAlignment
]

{ #category : #initialization }
TbLinearLayout >> initialize [
	super initialize.
	
	weightSum := self defaultWeightSum.
	shouldUseLargestChild := false.
	cellSpacing := 0.
	verticalAlignment := self defaultVerticalAlignment.
	horizontalAlignment := self defaultHorizontalAlignment.
	
	self orientation: self defaultOrientation.
]

{ #category : #testing }
TbLinearLayout >> isHorizontal [
	^ self orientation isHorizontal
]

{ #category : #testing }
TbLinearLayout >> isVertical [
	^ self orientation isVertical
]

{ #category : #layout }
TbLinearLayout >> layout: anElement in: aRectangle [
	self orientation layout: anElement in: aRectangle.
	self layoutIgnored: anElement
]

{ #category : #measure }
TbLinearLayout >> measure: anElement with: anExtentSpec [
	| aMeasurer |
	"I measure a new extent of myself and my children"
	
	aMeasurer := self orientation isHorizontal
		ifTrue: [ BlLinearLayoutHorizontalMeasurer new ]
		ifFalse: [ BlLinearLayoutVerticalMeasurer new ].
		
	aMeasurer
		initializeWith: anElement
		layout: self
		extentSpec: anExtentSpec
		orientation: self orientation.
	
	aMeasurer measure.
	
	self measureIgnored: anElement with: (BlExtentMeasurementSpec exact: anElement measuredExtent)
]

{ #category : #accessing }
TbLinearLayout >> orientation [
	^ orientation
]

{ #category : #accessing }
TbLinearLayout >> orientation: anOrientation [
	orientation := anOrientation.
	anOrientation applyLayoutIn: self
]

{ #category : #testing }
TbLinearLayout >> shouldUseLargestChild [
	"When true, all children with a weight will be considered having the minimum size of the largest child.
	If false, all children are measured normally."
	<return: #Boolean>

	^ shouldUseLargestChild
]

{ #category : #accessing }
TbLinearLayout >> verticalAlignment [
	^ verticalAlignment
]

{ #category : #accessing }
TbLinearLayout >> verticalAlignment: anAlignment [
	verticalAlignment := anAlignment
]

{ #category : #accessing }
TbLinearLayout >> weightSum [
	<return: #Number>

	^ weightSum
]

{ #category : #accessing }
TbLinearLayout >> weightSum: aNumber [
	weightSum := aNumber
]

{ #category : #'api - configuration' }
TbLinearLayout >> withSpaceEqualization [
	"When set to true, all children with a weight will be considered having the minimum size of the largest child.
	If false, all children are measured normally.
	Disabled by default."

	shouldUseLargestChild := true
]

{ #category : #'api - configuration' }
TbLinearLayout >> withoutSpaceEqualization [
	"When set to true, all children with a weight will be considered having the minimum size of the largest child.
	If false, all children are measured normally.
	Disabled by default."

	shouldUseLargestChild := false
]
