"
I layout elements in a rectangular grid.

All children of an element with GridLayout must use GridConstraints that allows users to configure how children are located within grid independently. 

A grid consists of cells that are separated by invisible lines. Each line is assigned to an index, meaning that a grid with N columns would have N+1 line. Indices lie in closed interval [ 1, N + 1 ]. 

Grid Layout supports fitContent, matchParent and exact resizing mode of the owner. Children are allowed to have fitContent and exact resizing modes. Because child's matchParent does not make sense in case of grid users should use #fill to declare that child should take all available cell's space.

By default grid layout does not specify how many columns and rows exist, instead it tries to compute necessary amount of columns or rows depending on amount of children. User can specify amount of columns or rows by sending columnCount: or rowCount: to an instance of grid layout.

Grid Layout supports spacing between cells which can be set sending cellSpacing: message.

Public API and Key Messages

- columnCount: aNumber to specify amount of columns
- rowCount: aNumber to specify amount of rows
- cellSpacing: aNumber to specify spacing between cells
- alignMargins  bounds of each element are extended outwards, according to their margins, before the edges of the resulting rectangle are aligned.
- alignBounds  alignment is made between the edges of each component's raw bounds

   BlGridLayout new
	columnCount: 2;
	rowCount: 3;
	cellSpacing: 10;
	alignMargins
 
Internal Representation and Key Implementation Points.

    Instance Variables
	alignmentMode:		<BlGridAlignmentMode>
	cellSpacing:		<Number>
	horizontalAxis:		<BlGridLayoutAxis>
	lastLayoutParamsHashCode:		<Number>
	orientation:		<BlGridOrientation>
	verticalAxis:		<BlGridLayoutAxis>


    Implementation Points
"
Class {
	#name : 'TbGridLayout',
	#superclass : 'TbLayout',
	#instVars : [
		'impl',
		'cellSpacing',
		'orientation',
		'alignment'
	],
	#pools : [
		'TbGridLayoutConstants'
	],
	#category : 'Turbo-Layout-Grid',
	#package : 'Turbo-Layout',
	#tag : 'Grid'
}

{ #category : 'constraints' }
TbGridLayout class >> constraints [
	^ TbGridLayoutConstraints new
]

{ #category : 'factory' }
TbGridLayout class >> horizontal [
	^ self new
		horizontal;
		yourself
]

{ #category : 'factory' }
TbGridLayout class >> vertical [
	^ self new
		vertical;
		yourself
]

{ #category : 'accessing' }
TbGridLayout >> alignBounds [
	alignment := TbGridAlignmentMode alignBounds
]

{ #category : 'accessing' }
TbGridLayout >> alignMargins [
	alignment := TbGridAlignmentMode alignMargins
]

{ #category : 'accessing' }
TbGridLayout >> alignment [
	^ alignment
]

{ #category : 'accessing' }
TbGridLayout >> cellSpacing [
	^ cellSpacing
]

{ #category : 'accessing' }
TbGridLayout >> cellSpacing: aNumber [
	cellSpacing := aNumber
]

{ #category : 'accessing' }
TbGridLayout >> columnCount: aNumber [
	impl columnCount: aNumber
]

{ #category : 'initialization' }
TbGridLayout >> defaultAlignment [
	^ TbGridAlignmentMode alignMargins
]

{ #category : 'initialization' }
TbGridLayout >> defaultCellSpacing [
	^ 0.0
]

{ #category : 'initialization' }
TbGridLayout >> defaultOrientation [
	^ TbGridOrientation horizontal
]

{ #category : 'accessing' }
TbGridLayout >> horizontal [
	orientation := TbGridOrientation horizontal.
	impl invalidateStructure
]

{ #category : 'initialization' }
TbGridLayout >> initialize [
	super initialize.
	
	cellSpacing := self defaultCellSpacing.
	orientation := self defaultOrientation.
	alignment := self defaultAlignment.

	impl := TbGridLayoutImpl on: self
]

{ #category : 'layout' }
TbGridLayout >> layout: anElement in: aRectangle [
	impl layout: anElement in: aRectangle.
	self layoutIgnored: anElement
]

{ #category : 'measure' }
TbGridLayout >> measure: anElement with: anExtentSpec [
	impl measure: anElement with: anExtentSpec.

	self measureIgnored: anElement with: (TbExtentMeasurementSpec exact: anElement measuredExtent)
]

{ #category : 'accessing' }
TbGridLayout >> orientation [
	^ orientation
]

{ #category : 'accessing' }
TbGridLayout >> rowCount: aNumber [
	impl rowCount: aNumber
]

{ #category : 'accessing' }
TbGridLayout >> vertical [
	orientation := TbGridOrientation vertical.
	impl invalidateStructure
]
