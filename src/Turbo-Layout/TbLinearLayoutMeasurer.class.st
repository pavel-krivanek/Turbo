Class {
	#name : 'TbLinearLayoutMeasurer',
	#superclass : 'Object',
	#instVars : [
		'useLargestChild',
		'cellSpacing',
		'nodes',
		'parent',
		'breadthSpec',
		'lengthSpec',
		'orientation',
		'totalLength',
		'totalWeight',
		'skippedMeasure',
		'extentSpec',
		'usedExcessSpace',
		'largestChildLength',
		'matchBreadth',
		'maxBreadth',
		'allFillParent',
		'weightedMaxBreadth',
		'alternativeMaxBreadth',
		'measuredLength',
		'useSpaceDistribution',
		'layout'
	],
	#category : 'Turbo-Layout-Linear-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Linear-Utilities'
}

{ #category : 'measurement' }
TbLinearLayoutMeasurer >> baselineMeasure [
	self subclassResponsibility
]

{ #category : 'accessing' }
TbLinearLayoutMeasurer >> breadthSpec [
	^ breadthSpec
]

{ #category : 'accessing - properties' }
TbLinearLayoutMeasurer >> cellSpacing [
	^ cellSpacing
]

{ #category : 'initialization' }
TbLinearLayoutMeasurer >> initialize [
	super initialize.

	useLargestChild := false.
	cellSpacing := 0.

	totalLength := 0.
	totalWeight := 0.
	usedExcessSpace := 0.
	skippedMeasure := false.
	matchBreadth := false.
	largestChildLength := 0.
	measuredLength := 0.
	alternativeMaxBreadth := 0.
	maxBreadth := 0.
	allFillParent := true.
	weightedMaxBreadth := 0
]

{ #category : 'initialization' }
TbLinearLayoutMeasurer >> initializeWith: aParentElement layout: aLinearLayout extentSpec: anExtentSpec orientation: aBlLinearLayoutOrientation [

	parent := aParentElement.
	orientation := aBlLinearLayoutOrientation.
	layout := aLinearLayout.
	useLargestChild := layout shouldUseLargestChild.
	cellSpacing := layout cellSpacing.

	extentSpec := anExtentSpec.
	breadthSpec := orientation breadthSpec: anExtentSpec.
	lengthSpec := orientation lengthSpec: anExtentSpec.

	nodes := aParentElement children accountedByLayout
		collect: [ :aChildElement | TbLinearLayoutNode new initializeWith: aChildElement orientation: orientation ]
]

{ #category : 'testing' }
TbLinearLayoutMeasurer >> isBreadthExact [
	^ self breadthSpec isExact
]

{ #category : 'testing' }
TbLinearLayoutMeasurer >> isLengthExact [
	^ self lengthSpec isExact
]

{ #category : 'measurement' }
TbLinearLayoutMeasurer >> largestMeasure [
	"I re-measure my length for the case when we consider all weighted children to have the minimum size of the largest child"
	
	self useLargestChild
		ifFalse: [ ^ self ].
	
	(lengthSpec isAtMost or: [ lengthSpec isUnspecified ])
		ifFalse: [ ^ self ].
	
	totalLength := 0.
	
	self nodes do: [ :aNode | self updateTotalLengthFromLargestChild: aNode ]
]

{ #category : 'accessing' }
TbLinearLayoutMeasurer >> lengthSpec [
	^ lengthSpec
]

{ #category : 'measurement' }
TbLinearLayoutMeasurer >> measure [
	self preMeasure.

	self baselineMeasure.
	self largestMeasure.

	totalLength := totalLength + (orientation paddingLength: parent).
	
	self weightedMeasure.
	self postMeasure.
	self uniformMeasure
]

{ #category : 'private - measurement' }
TbLinearLayoutMeasurer >> measureExactUsingExcessSpace: aNode [
	"Optimization: don't bother measuring children who are only laid out using excess space.
	These views will get measured later if we have space to distribute."
	
	self subclassResponsibility
]

{ #category : 'accessing' }
TbLinearLayoutMeasurer >> nodes [
	<return: #Collection of: #BlLinearLayoutNode>

	^ nodes
]

{ #category : 'accessing' }
TbLinearLayoutMeasurer >> parent [
	<return: #BlElement>

	^ parent
]

{ #category : 'measurement' }
TbLinearLayoutMeasurer >> postMeasure [

	(allFillParent not and: [ breadthSpec isExact not ])
		ifTrue: [ maxBreadth := alternativeMaxBreadth ].
		
	maxBreadth := maxBreadth + (orientation paddingBreadth: parent).

	"Check against our minimum height"
	maxBreadth := maxBreadth max: (orientation minimalBreadth: parent).

	parent measuredExtent: (orientation extentBreadth: (breadthSpec sizeFor: maxBreadth) lengthSpec: measuredLength).
]

{ #category : 'measurement' }
TbLinearLayoutMeasurer >> preMeasure [

	"See how wide/tall everyone is. Also remember max breadth."
	self nodes do: [ :aNode |
		| matchBreadthLocally childBreadth shouldUseExcessSpace |
	
		aNode hasSpaceBefore
			ifTrue: [ totalLength := totalLength + self cellSpacing ].
		
		totalWeight := totalWeight + aNode weight.
		
		"we must store the result because it may temporary change during measurement"
		shouldUseExcessSpace := (lengthSpec isUnspecified not or: [ useLargestChild ]) and: [ aNode shouldUseExcessSpace ].

		(self isLengthExact and: [ shouldUseExcessSpace ])
			ifTrue: [ self measureExactUsingExcessSpace: aNode ]
			ifFalse: [
				| usedLength childLength |
				"The widthMode is either UNSPECIFIED or AT_MOST, and
				this child is only laid out using excess space.
				Measure using WRAP_CONTENT so that we can find out the view's optimal width.
				We'll restore the original width of 0 after measurement."
				shouldUseExcessSpace
					ifTrue: [ aNode lengthResizer: TbLayoutResizer fitContent ].

				"Determine how big this child would like to be.
				If this or previous children have given a weight,
				then we allow it to use all available space (and we will shrink things later if needed)."
				usedLength := totalWeight isZero
					ifTrue: [ totalLength ]
					ifFalse: [ 0 ].
				orientation
					measureChildWithMargin: aNode element
					parentSpec: extentSpec
					breadthUsed: 0
					lengthUsed: usedLength.

				childLength := aNode measuredLength.
				shouldUseExcessSpace
					ifTrue: [
						"Restore the original width and record how much space
						we've allocated to excess-only children so that we can
						match the behavior of EXACTLY measurement."
						aNode lengthResizer: TbLayoutResizer matchParent.
						usedExcessSpace := usedExcessSpace + childLength ].
				
				self updateTotalLengthAfterMeasuring: aNode.
				
				self useLargestChild
					ifTrue: [ largestChildLength := largestChildLength max: childLength ] ].
		
		self flag: 'Add baseline support here'.
		
		matchBreadthLocally := false.
		(self isBreadthExact not and: [ aNode breadthResizer isMatchParent ])
			ifTrue: [
				"The height of the linear layout will scale, and at least one child said it wanted to match our height.
				Set a flag indicating that we need to remeasure at least that view when we know our height."
				matchBreadth := true.
				matchBreadthLocally := true ].
		
		childBreadth := aNode measuredBreadth + aNode marginBreadth.

		maxBreadth := maxBreadth max: childBreadth.
		allFillParent := allFillParent and: [ aNode breadthResizer isMatchParent ].
		
		aNode weight > 0
			ifTrue: [
				"Heights of weighted elements are bogus if we end up remeasuring, so keep them separate."
				weightedMaxBreadth := (matchBreadthLocally
					ifTrue: [ aNode marginBreadth ]
					ifFalse: [ childBreadth ]) max: weightedMaxBreadth ]
			ifFalse: [
				alternativeMaxBreadth := (matchBreadthLocally
					ifTrue: [ aNode marginBreadth ]
					ifFalse: [ childBreadth ]) max: alternativeMaxBreadth ] ].
			
	self nodes ifNotEmpty: [ :theNodes |
		theNodes last hasSpaceAfter
			ifTrue: [ totalLength := totalLength + self cellSpacing ] ]
]

{ #category : 'private - measurement' }
TbLinearLayoutMeasurer >> prepareForWeightedMeasure [
	self subclassResponsibility
]

{ #category : 'private - measurement' }
TbLinearLayoutMeasurer >> processBaseline: aNode breadth: aChildBreadth [
	"I process baseline of a given child node if it is supported."

	self subclassResponsibility
]

{ #category : 'accessing - properties' }
TbLinearLayoutMeasurer >> remainingWeightSum [
	<return: #Number>

	^ self weightSum > 0
		ifTrue: [ self weightSum ]
		ifFalse: [ totalWeight ]
]

{ #category : 'measurement' }
TbLinearLayoutMeasurer >> uniformMeasure [
	| uniformMeasureSpec |
	matchBreadth
		ifFalse: [ ^ self ].
		
	"Pretend that the linear layout has an exact size. This is the measured height of ourselves.
	The measured height should be the max height of the children, changed to accommodate the heightMeasureSpec from the parent"
	
	uniformMeasureSpec := TbMeasurementSpec exact: (orientation measuredBreadth: parent).
	
	self nodes
		select: [ :aNode | aNode breadthResizer isMatchParent ]
		thenDo: [ :aNode |
			| oldResizer |
			"Temporarily force children to reuse their old measured width"
			oldResizer := aNode lengthResizer.
			aNode lengthResizer: (TbLayoutResizer exact: aNode measuredLength).
			
			"Remeasure with new dimensions"
			orientation 
				measureChildWithMargin: aNode element
				parentSpec: (orientation 
					extentSpecBreadth: uniformMeasureSpec
					lengthSpec: self lengthSpec)
				breadthUsed: 0
				lengthUsed: 0.
				
			aNode lengthResizer: oldResizer ].
]

{ #category : 'private - measurement' }
TbLinearLayoutMeasurer >> updateTotalLengthAfterMeasuring: aNode [
	"I update the total length after measuring a given node based on its measured length and margin"

	self subclassResponsibility
]

{ #category : 'private - measurement' }
TbLinearLayoutMeasurer >> updateTotalLengthFromLargestChild: aNode [
	"I update the total length taking into account the length of the largest child"

	self subclassResponsibility
]

{ #category : 'accessing - properties' }
TbLinearLayoutMeasurer >> useLargestChild [
	^ useLargestChild
]

{ #category : 'accessing - properties' }
TbLinearLayoutMeasurer >> weightSum [
	^ layout weightSum
]

{ #category : 'measurement' }
TbLinearLayoutMeasurer >> weightedMeasure [
	"I measure weighted children if there is enough excess space"	
	| remainingExcess |

	"Check against our minimum length"
	measuredLength := totalLength max: (orientation minimalLength: parent).

	"Reconcile our calculated size with the lengthSpec"
	measuredLength := lengthSpec sizeFor: measuredLength.
	
	"Either expand children with weight to take up available space or shrink them if they extend beyond our current bounds.
	If we skipped measurement on any children, we need to measure them now."
	remainingExcess := measuredLength - totalLength + usedExcessSpace.
	
	(skippedMeasure or: [ remainingExcess > 0 and: [ totalWeight > 0 ] ])
		ifTrue: [
			| remainingWeightSum |
			
			remainingWeightSum := self remainingWeightSum.
			
			self prepareForWeightedMeasure.
			
			self nodes do: [ :aNode |
				| childWeight childLength childBreadth matchBreadthLocally |
				
				childWeight := aNode weight.
				childWeight > 0
					ifTrue: [
						| shareSpace childLengthSpec childBreadthSpec |
						
						shareSpace := (childWeight * remainingExcess / remainingWeightSum) asInteger.
						remainingExcess := remainingExcess - shareSpace.
						remainingWeightSum := remainingWeightSum - childWeight.

						childLength := (self useLargestChild and: [ self isLengthExact not ])
							ifTrue: [ largestChildLength ]
							ifFalse: [ aNode lengthResizer isMatchParent
								"This child needs to be laid out from scratch using only its share of excess space."
								ifTrue: [ shareSpace ]
								"This child had some intrinsic width to which we need to add its share of excess space."
								ifFalse: [ aNode measuredLength + shareSpace ] ].
							
						childLengthSpec := TbMeasurementSpec exact: (0 max: childLength).
						childBreadthSpec := parent layout
							measurementSpecFor: breadthSpec
							usedSize: (orientation paddingBreadth: parent) + (aNode marginBreadth)
							resizer: aNode breadthResizer.
							
						 aNode measure: (orientation extentSpecBreadth: childBreadthSpec lengthSpec: childLengthSpec) ].
				
				self updateTotalLengthAfterMeasuring: aNode.

				matchBreadthLocally := breadthSpec isExact not and: [ aNode breadthResizer isMatchParent ].
				childBreadth := aNode measuredBreadth + aNode marginBreadth.
				maxBreadth := maxBreadth max: childBreadth.
				alternativeMaxBreadth := (matchBreadthLocally
					ifTrue: [ aNode marginBreadth ]
					ifFalse: [ childBreadth ]) max: alternativeMaxBreadth.
				allFillParent := allFillParent and: [ aNode breadthResizer isMatchParent ] ].
			
			totalLength := totalLength + (orientation paddingLength: parent).
			self baselineMeasure ]

		ifFalse: [
			alternativeMaxBreadth := alternativeMaxBreadth max: weightedMaxBreadth.
			
			" We have no limit, so make all weighted views as wide as the largest child.
           Children will have already been measured once."
			(self useLargestChild and: [ self isLengthExact not ])
				ifTrue: [
					self nodes
						select: [ :aNode | aNode weight > 0 ]
						thenDo: [ :aNode |
							aNode measure: (orientation
								extentBreadth: (TbMeasurementSpec exact: aNode measuredBreadth)
								lengthSpec: (TbMeasurementSpec exact: largestChildLength)) ] ] ]
]
