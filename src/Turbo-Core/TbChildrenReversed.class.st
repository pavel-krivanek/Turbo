"
I reverse an underlying collection of children.

${example:BlChildrenSubsetExamples>>#reversedChildrenFromElement}$

"
Class {
	#name : #TbChildrenReversed,
	#superclass : #TbChildrenSubset,
	#category : #'Turbo-Core-Basic-Children'
}

{ #category : #'instance creation' }
TbChildrenReversed class >> on: aBlChildren [
	^ self new initializeFrom: aBlChildren
]

{ #category : #'children - accessing' }
TbChildrenReversed >> at: anIndex [
	<return: #BlElement>

	^ super at: (self size - anIndex + 1)
]

{ #category : #'children - enumerating' }
TbChildrenReversed >> do: aBlock [
	subsetArray reverseDo: aBlock
]

{ #category : #accessing }
TbChildrenReversed >> name [
	^ 'Reversed'
]

{ #category : #'children - subsets' }
TbChildrenReversed >> reversed [
	^ TbChildrenArray from: subsetArray
]

{ #category : #initialization }
TbChildrenReversed >> subsetFrom: aBlChildren [
	"Only convert the given collection to an array. Iteration is performed on reverse order on that array."
	^ aBlChildren asArray
]
