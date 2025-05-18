"
I represent a subset of children that are accounted (not ignored) by layout.

${example:BlChildrenSubsetExamples>>#accountedByLayoutChildrenFromElement}$

"
Class {
	#name : 'TbChildrenAccountedByLayout',
	#superclass : 'TbChildrenSubset',
	#category : 'Turbo-Core-Basic-Children',
	#package : 'Turbo-Core',
	#tag : 'Basic-Children'
}

{ #category : 'children - subsets' }
TbChildrenAccountedByLayout >> accountedByLayout [
	^ self
]

{ #category : 'accessing' }
TbChildrenAccountedByLayout >> name [
	^ 'Accounted by layout'
]

{ #category : 'initialization' }
TbChildrenAccountedByLayout >> subsetFrom: aBlChildren [
	^ aBlChildren select: [ :anElement |
		anElement constraints ignoredByLayout not
			and: [ anElement visibility isGone not ] ]
]
