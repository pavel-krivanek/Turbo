"
I sort a collection of children by elevation in ascending order.

${example:BlChildrenSubsetExamples>>#sortedByElevationFromElement}$


"
Class {
	#name : 'TbChildrenSortedByElevation',
	#superclass : 'TbChildrenSubset',
	#category : 'Turbo-Core-Basic-Children',
	#package : 'Turbo-Core',
	#tag : 'Basic-Children'
}

{ #category : 'accessing' }
TbChildrenSortedByElevation >> name [
	^ 'Sorted by elevation'
]

{ #category : 'children - subsets' }
TbChildrenSortedByElevation >> sortedByElevation [
	^ self
]

{ #category : 'initialization' }
TbChildrenSortedByElevation >> subsetFrom: aBlChildren [
	"Perform the sort when the instance is created."
	^ aBlChildren asArray sorted: [ :a :b | 
		(a elevation relatedTo: 0) <= (b elevation relatedTo: 0) ]
]
