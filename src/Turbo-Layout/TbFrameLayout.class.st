Class {
	#name : #TbFrameLayout,
	#superclass : #TbLayout,
	#category : #'Turbo-Layout-Frame'
}

{ #category : #constraints }
TbFrameLayout class >> constraints [
	^ TbFrameLayoutConstraints new
]

{ #category : #'api - alignment' }
TbFrameLayout >> align: aChildElement horizontal: aBlAlignment [
	aChildElement constraintsDo: [ :c | (c at: self class) horizontal alignment: aBlAlignment ]
]

{ #category : #'api - alignment' }
TbFrameLayout >> align: aChildElement vertical: aBlAlignment [
	aChildElement constraintsDo: [ :c | (c at: self class) vertical alignment: aBlAlignment ]
]

{ #category : #layout }
TbFrameLayout >> layout: anElement in: aRectangle [
	| parentBounds |
	
	self layoutIgnored: anElement.
	
	"first store parent's local bounds"
	parentBounds := anElement padding inset: (0@0 extent: aRectangle extent).

	self
		layeredChildren: anElement
		do: [ :aChild |
			| childBounds alloowedBounds |
			"ask child for its measured bounds"
			childBounds := aChild measuredBounds bounds copy.
			alloowedBounds := aChild margin inset: parentBounds copy.
		
			"frame layout supports alignment, so we need to translate child's bounds accordingly to alignment"
			childBounds := childBounds := self
				align: aChild
				bounds: childBounds
				in: alloowedBounds
				with: aChild constraints frame alignment.
			"and finally set new bounds"
			aChild applyLayoutIn: childBounds ].
]

{ #category : #measure }
TbFrameLayout >> measure: anElement with: anExtentSpec [
	| matchParentChildren |

	"First measure children that know their size (exact and fit content),
	collecting those that needs to be measured later after we know parent's size"
	matchParentChildren := self measureChildren: anElement with: anExtentSpec.
	"Second pass to measure children that match parent"
	self measureMatching: matchParentChildren of: anElement with: anExtentSpec
]

{ #category : #measure }
TbFrameLayout >> measureChild: aChildElement of: anElement with: anExtentSpec [
	| aParentHeight aParentWidth |

	aParentWidth := anExtentSpec widthSpec isUnspecified
		ifTrue: [ 0 ]
		ifFalse: [ anExtentSpec widthSpec size ].
	aParentHeight := anExtentSpec heightSpec isUnspecified
		ifTrue: [ 0 ]
		ifFalse: [ anExtentSpec heightSpec size ].

	self
		measureChild: aChildElement
		of: anElement
		with: anExtentSpec
		width: aParentWidth
		height: aParentHeight
]

{ #category : #measure }
TbFrameLayout >> measureChild: aChildElement of: anElement with: anExtentSpec width: aParentWidth height: aParentHeight [
	| childWidthMeasureSpec childHeightMeasureSpec |

	aChildElement constraints horizontal resizer isMatchParent
		ifTrue: [ 
			| weight width |
			weight := (aChildElement constraints frame horizontal weight max: 0).
			width := ((aParentWidth - anElement insets width - aChildElement outsets width) * weight) max: 0.
			childWidthMeasureSpec := TbMeasurementSpec exact: width ]
		ifFalse: [ 
			childWidthMeasureSpec := self
				measurementSpecFor: anExtentSpec widthSpec
				usedSize: anElement insets width + aChildElement outsets width
				resizer: aChildElement constraints horizontal resizer ].

	aChildElement constraints vertical resizer isMatchParent
		ifTrue: [ 
			| weight height |
			weight := (aChildElement constraints frame vertical weight max: 0).
			height := ((aParentHeight - anElement insets height - aChildElement outsets height) * weight) max: 0.
			childHeightMeasureSpec := TbMeasurementSpec exact: height ]
		ifFalse: [ 
			childHeightMeasureSpec := self
				measurementSpecFor: anExtentSpec heightSpec
				usedSize: anElement insets height + aChildElement outsets height
				resizer: aChildElement constraints vertical resizer ].

	aChildElement measure: childWidthMeasureSpec @ childHeightMeasureSpec
]

{ #category : #measure }
TbFrameLayout >> measureChildren: anElement with: anExtentSpec [
	"Perform a first measurement pass and measure those children for which we can
	determine an extent, otherwise add children to a collection that should be
	measured during second pass and return it"
	<return: #LinkedList of: #BlElement>
	| measureMatchParentChildren matchParentChildren maxHeight maxWidth |
	
	matchParentChildren := LinkedList new.
	
	"true if children matching parent should be measured in first pass"	
	measureMatchParentChildren := anExtentSpec isExact.

	maxWidth := 0.
	maxHeight := 0.

	self measureIgnored: anElement with: anExtentSpec.
	
	self
		measuredChildren: anElement
		do: [ :aChild |
			| shouldMeasureChild |
			
			"true if aChild should be measured NOW or false if it should happen during second measurement pass.
			we measure children if parent is exact or if child does not match parent"
			shouldMeasureChild := measureMatchParentChildren
				or: [ aChild constraints horizontal resizer isMatchParent not
					and: [ aChild constraints vertical resizer isMatchParent not ] ].
			shouldMeasureChild
				"measure now"
				ifTrue: [
					self measureChild: aChild of: anElement with: anExtentSpec.
					maxWidth := maxWidth max: (aChild measuredWidth + aChild outsets width).
					maxHeight := maxHeight max: (aChild measuredHeight + aChild outsets height) ]
				"or during second pass"
				ifFalse: [ matchParentChildren add: aChild ] ].
	
	maxWidth := maxWidth + anElement insets width.
	maxHeight := maxHeight + anElement insets height.

	maxWidth := maxWidth max: anElement constraints minWidth.
	maxHeight := maxHeight max: anElement constraints minHeight.
	
	anElement measuredExtent: (anExtentSpec sizeFor: maxWidth @ maxHeight).
	
	^ matchParentChildren
]

{ #category : #measure }
TbFrameLayout >> measureMatching: theChildren of: anElement with: anExtentSpec [
	theChildren
		ifEmpty: [ ^ self ].

	theChildren do: [ :aChildElement |
		self measureMatchingChild: aChildElement of: anElement with: anExtentSpec ]
]

{ #category : #measure }
TbFrameLayout >> measureMatchingChild: aChildElement of: anElement with: anExtentSpec [
	| aParentHeight aParentWidth |

	aParentWidth := anExtentSpec widthSpec isUnspecified
		ifTrue: [ 0 ]
		ifFalse: [ anExtentSpec widthSpec size ].
	aParentHeight := anExtentSpec heightSpec isUnspecified
		ifTrue: [ 0 ]
		ifFalse: [ anExtentSpec heightSpec size ].

	self
		measureChild: aChildElement
		of: anElement
		with: anExtentSpec
		width: anElement measuredWidth
		height: anElement measuredHeight
]
