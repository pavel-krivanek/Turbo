Class {
	#name : #TbLinearLayoutHorizontalOrientation,
	#superclass : #TbLinearLayoutOrientation,
	#category : #'Turbo-Layout-Linear-Utilities'
}

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> breadthMode [
	^ self layout cache heightMode
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> breadthProperties: anElement [
	^ anElement constraints vertical
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> breadthSpec [
	^ self layout cache heightMeasureSpec
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> breadthSpec: anExtentSpec [
	^ anExtentSpec heightSpec
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> extentBreadth: breadth lengthSpec: length [
	^ length @ breadth
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> extentSpecBreadth: breadthSpec lengthSpec: lengthSpec [
	^ TbExtentMeasurementSpec new
		widthSpec: lengthSpec;
		heightSpec: breadthSpec
]

{ #category : #testing }
TbLinearLayoutHorizontalOrientation >> isHorizontal [
	^ true
]

{ #category : #layout }
TbLinearLayoutHorizontalOrientation >> layout: anElement in: aRectangle [
	|top right bottom left majorBounds elementInnerBounds theLayeredChildren |
	"Layout subnodes vertically in column one by one
	based on previousely measured extent"

	top := anElement insets top.
	left := anElement insets left. 
	right := left.
	bottom := top.

	theLayeredChildren := self layout layeredChildren: anElement.

	self layout direction
		with: theLayeredChildren
		do: [ :child |
			right := right + child measuredWidth + (child outsets width max: 0).
			bottom := bottom max: child measuredHeight + (child outsets height max: 0) ].
	
	majorBounds := (left@top corner: right@bottom).
	elementInnerBounds := anElement padding inset: anElement boundsInLocal.
	majorBounds = elementInnerBounds ifFalse: [
		| translation |
		translation := (self layout horizontalAlignment directed: self layout direction) translationOf: majorBounds in: elementInnerBounds.
		majorBounds := majorBounds translateBy: translation ].

	right := majorBounds right.
	bottom := majorBounds bottom.
	left := majorBounds left.
	top := majorBounds top.
	
	self layout direction
		with: theLayeredChildren
		inject: left @ top
		into: [ :origin :child |
			| childBounds childMarginBounds childConstraints |
			childConstraints := child constraints linear.
			childBounds := origin + (child outsets topLeft max: 0@0) extent: child measuredExtent.
			childMarginBounds := origin extent: child measuredExtent + (child outsets extent max: 0@0).  

			self layout verticalAlignment ifNotNull: [ 
				| translation allowedBounds |
				allowedBounds := childMarginBounds origin extent: child measuredWidth @ elementInnerBounds height.
				translation := self layout verticalAlignment translationOf: childMarginBounds in: allowedBounds.
				childBounds := childBounds translateBy: translation ].

			self layout verticalAlignment ifNull: [ 
				| translation allowedBounds |
				allowedBounds := childMarginBounds origin extent: child measuredWidth @ elementInnerBounds height.
				translation := childConstraints vertical alignment translationOf: childMarginBounds in: allowedBounds.
				childBounds := childBounds translateBy: translation ].
			
			childBounds := childBounds translateBy: (self layout cellSpacing @ 0).
			
			"telling each subnode what bounds to use for layouting process.
			Because measuring process does not modify actual extent
			we need to use a measured one"
			child applyLayoutIn: childBounds.
			"translating origin horizontally right for next subnode"
			(origin x + child measuredWidth + (child outsets width max: 0) + self layout cellSpacing) @ origin y ]
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> lengthLinearProperties: aChildElement [
	^ aChildElement constraints linear horizontal
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> lengthMode [
	^ self layout cache widthMode
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> lengthProperties: aChildElement [
	^ aChildElement constraints horizontal
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> lengthSpec [
	^ self layout cache widthMeasureSpec
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> lengthSpec: anExtentSpec [
	^ anExtentSpec widthSpec
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> marginBreadth: anElement [
	^ anElement outsets height
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> marginLength: anElement [
	^ anElement outsets width
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> measureChildWithMargin: child parentSpec: anExtentMeasurementSpec breadthUsed: breadthUsed lengthUsed: lengthUsed [
	self layout
		measureChildWithMargins: child
		parentSpec: anExtentMeasurementSpec
		widthUsed: lengthUsed
		heightUsed: breadthUsed
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> measuredBreadth: anElement [
	^ anElement measuredHeight
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> measuredLength: anElement [
	^ anElement measuredWidth
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> minimalBreadth: anElement [
	^ anElement constraints minHeight
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> minimalLength: anElement [
	^ anElement constraints minWidth
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> paddingBreadth: anElement [
	^ anElement insets height
]

{ #category : #orientation }
TbLinearLayoutHorizontalOrientation >> paddingLength: anElement [
	^ anElement insets width
]
