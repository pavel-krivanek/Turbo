Class {
	#name : #TbLinearLayoutVerticalOrientation,
	#superclass : #TbLinearLayoutOrientation,
	#category : #'Turbo-Layout-Linear-Utilities'
}

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> breadthMode [
	^ self layout cache widthMode
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> breadthProperties: anElement [
	^ anElement constraints horizontal
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> breadthSpec [
	^ self layout cache widthMeasureSpec
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> breadthSpec: anExtentSpec [
	^ anExtentSpec widthSpec
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> extentBreadth: breadth lengthSpec: length [
	^ breadth @ length
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> extentSpecBreadth: breadthSpec lengthSpec: lengthSpec [
	^ TbExtentMeasurementSpec new
		widthSpec: breadthSpec;
		heightSpec: lengthSpec
]

{ #category : #testing }
TbLinearLayoutVerticalOrientation >> isVertical [
	^ true
]

{ #category : #layout }
TbLinearLayoutVerticalOrientation >> layout: anElement in: aRectangle [
	|top right bottom left majorBounds elementInnerBounds|
	"Layout subnodes vertically in column one by one
	based on previously measured extent"
	
	top := anElement insets top.
	left := anElement insets left. 
	right := left.
	bottom := top.

	anElement children accountedByLayout do: [ :child | 
		right := right max: child measuredWidth + (child outsets width max: 0).
		bottom := bottom + child measuredHeight + (child outsets height max: 0) ].
	
	majorBounds := (left@top corner: right@bottom).
	elementInnerBounds := anElement padding inset: anElement boundsInLocal.
	majorBounds = elementInnerBounds ifFalse: [
		| translation |
		translation := self layout verticalAlignment translationOf: majorBounds in: elementInnerBounds.
		majorBounds := majorBounds translateBy: translation ].

	right := majorBounds right.
	bottom := majorBounds bottom.
	left := majorBounds left.
	top := majorBounds top.

	anElement children accountedByLayout
		inject: left @ top
		into: [ :origin :child |
			| childBounds childMarginBounds childConstraints |
			childConstraints := child constraints linear.
			childBounds := origin + (child outsets topLeft max: 0@0) extent: child measuredExtent.
			childMarginBounds := origin extent: child measuredExtent + (child outsets extent max: 0@0).  
			
			self layout horizontalAlignment ifNotNull: [ 
				| translation allowedBounds |
				allowedBounds := childMarginBounds origin extent: elementInnerBounds width @ child measuredHeight.
				translation := (self layout horizontalAlignment directed: self layout direction) translationOf: childMarginBounds in: allowedBounds.
				childBounds := childBounds translateBy: translation ].

			self layout horizontalAlignment ifNull: [ 
				| translation allowedBounds |
				allowedBounds := childMarginBounds origin extent: elementInnerBounds width @ child measuredHeight.
				translation := (childConstraints horizontal alignment directed: self layout direction) translationOf: childMarginBounds in: allowedBounds.
				childBounds := childBounds translateBy: translation ].
			
			childBounds := childBounds translateBy: (0 @ self layout cellSpacing).
			
			"telling each subnode what bounds to use for layouting process.
			Because measuring process does not modify actual extent
			we need to use a measured one"
			child applyLayoutIn: childBounds.
			"translating origin vertically down for next subnode"
			origin x @(origin y + child measuredHeight + self layout cellSpacing + (child outsets height max: 0)) ]
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> lengthLinearProperties: aChildElement [
	^ aChildElement constraints linear vertical
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> lengthMode [
	^ self layout cache heightMode
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> lengthProperties: aChildElement [
	^ aChildElement constraints vertical
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> lengthSpec [
	^ self layout cache heightMeasureSpec
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> lengthSpec: anExtentSpec [
	^ anExtentSpec heightSpec
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> marginBreadth: anElement [
	^ anElement outsets width
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> marginLength: anElement [
	^ anElement outsets height
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> measureChildWithMargin: child parentSpec: anExtentMeasurementSpec breadthUsed: breadthUsed lengthUsed: lengthUsed [
	self layout
		measureChildWithMargins: child
		parentSpec: anExtentMeasurementSpec
		widthUsed: breadthUsed
		heightUsed: lengthUsed
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> measuredBreadth: anElement [
	^ anElement measuredWidth
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> measuredLength: anElement [
	^ anElement measuredHeight
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> minimalBreadth: anElement [
	^ anElement constraints minWidth
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> minimalLength: anElement [
	^ anElement constraints minHeight
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> paddingBreadth: anElement [
	^ anElement insets width
]

{ #category : #orientation }
TbLinearLayoutVerticalOrientation >> paddingLength: anElement [
	^ anElement insets height
]
