Class {
	#name : 'TbLinearLayoutVerticalMeasurer',
	#superclass : 'TbLinearLayoutMeasurer',
	#category : 'Turbo-Layout-Linear-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Linear-Utilities'
}

{ #category : 'measurement' }
TbLinearLayoutVerticalMeasurer >> baselineMeasure [
]

{ #category : 'private - measurement' }
TbLinearLayoutVerticalMeasurer >> measureExactUsingExcessSpace: aNode [
	"Optimization: don't bother measuring children who are only laid out using excess space.
	These views will get measured later if we have space to distribute."

	totalLength := totalLength max: (totalLength + aNode marginLength).
	skippedMeasure := true
]

{ #category : 'private - measurement' }
TbLinearLayoutVerticalMeasurer >> prepareForWeightedMeasure [
	totalLength := 0
]

{ #category : 'measurement' }
TbLinearLayoutVerticalMeasurer >> processBaseline: aNode breadth: aChildBreadth [
]

{ #category : 'private - measurement' }
TbLinearLayoutVerticalMeasurer >> updateTotalLengthAfterMeasuring: aNode [
	"I update the total length after measuring a given node based on its measured length and margin"

	totalLength := totalLength max: (totalLength + aNode measuredLength + aNode marginLength)
]

{ #category : 'private - measurement' }
TbLinearLayoutVerticalMeasurer >> updateTotalLengthFromLargestChild: aNode [
	"I update the total length taking into account the length of the largest child"

	totalLength := totalLength max: (totalLength + largestChildLength + aNode marginLength)
]
