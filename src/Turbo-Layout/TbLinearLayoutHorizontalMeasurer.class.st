Class {
	#name : 'TbLinearLayoutHorizontalMeasurer',
	#superclass : 'TbLinearLayoutMeasurer',
	#instVars : [
		'maxAscent',
		'maxDescent'
	],
	#category : 'Turbo-Layout-Linear-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Linear-Utilities'
}

{ #category : 'measurement' }
TbLinearLayoutHorizontalMeasurer >> baselineMeasure [
	"I adjust my max breadth based on current max ascent and descent"

	maxAscent ifNotEmpty: [
		| anAscent aDescent |
		
		anAscent := maxAscent values max.
		aDescent := maxDescent values max.
		maxBreadth := maxBreadth max: (anAscent + aDescent) ]
]

{ #category : 'initialization' }
TbLinearLayoutHorizontalMeasurer >> initialize [
	super initialize.

	maxAscent := Dictionary new.
	maxDescent := Dictionary new
]

{ #category : 'private - measurement' }
TbLinearLayoutHorizontalMeasurer >> measureExactUsingExcessSpace: aNode [
	"Optimization: don't bother measuring children who are only laid out using excess space.
	These views will get measured later if we have space to distribute."

	totalLength := self isLengthExact
		ifTrue: [ totalLength + aNode marginLength ]
		ifFalse: [ totalLength max: (totalLength + aNode marginLength) ].

	"Baseline alignment requires to measure widgets to obtain the baseline offset (in particular for TextElements).
	The following defeats the optimization mentioned above.
	Allow the child to use as much space as it wants because we can shrink things later (and re-measure)."
	skippedMeasure := true 
]

{ #category : 'private - measurement' }
TbLinearLayoutHorizontalMeasurer >> prepareForWeightedMeasure [
	maxAscent removeAll.
	maxDescent removeAll.
	
	totalLength := 0.
	
	self flag: 'Why reset max breadth?'.
	maxBreadth := 0.
]

{ #category : 'private - measurement' }
TbLinearLayoutHorizontalMeasurer >> updateTotalLengthAfterMeasuring: aNode [
	"I update the total length after measuring a given node based on its measured length and margin"
	
	self flag: 'Why accounting for isBreadthExact is needed for the horizontal layout?'.

	totalLength := self isLengthExact
		ifTrue: [ totalLength + aNode measuredLength + aNode marginLength ]
		ifFalse: [ totalLength max: (totalLength + aNode measuredLength + aNode marginLength) ]
]

{ #category : 'private - measurement' }
TbLinearLayoutHorizontalMeasurer >> updateTotalLengthFromLargestChild: aNode [
	"I update the total length taking into account the length of the largest child"

	self flag: 'Why accounting for isBreadthExact is needed for the horizontal layout?'.

	totalLength := self isBreadthExact
		ifTrue: [ totalLength + largestChildLength + aNode marginLength ]
		ifFalse: [ totalLength max: (totalLength + largestChildLength + aNode marginLength) ]
]
