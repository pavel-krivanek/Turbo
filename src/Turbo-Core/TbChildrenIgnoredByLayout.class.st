"
I represent a subset of children that are ignored by layout.

${example:BlChildrenSubsetExamples>>#ignoredByLayoutFromElement}$
"
Class {
	#name : #TbChildrenIgnoredByLayout,
	#superclass : #TbChildrenSubset,
	#category : #'Turbo-Core-Basic-Children'
}

{ #category : #'children - subsets' }
TbChildrenIgnoredByLayout >> ignoredByLayout [
	^ self
]

{ #category : #accessing }
TbChildrenIgnoredByLayout >> name [
	^ 'Ignored by layout'
]

{ #category : #initialization }
TbChildrenIgnoredByLayout >> subsetFrom: aBlChildren [
	^ aBlChildren select: [ :anElement |
		anElement constraints ignoredByLayout
			and: [ anElement visibility isGone not ] ]
]
