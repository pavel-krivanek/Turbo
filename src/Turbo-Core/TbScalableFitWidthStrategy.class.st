"
I make sure that content element fits horizontally within scalable element.

It makes sense to use me if scalable element has fixed or matching parent horizontal size but fits content vertically.
"
Class {
	#name : #TbScalableFitWidthStrategy,
	#superclass : #TbScalableStrategy,
	#category : #'Turbo-Core-Utilities - Scalable'
}

{ #category : #comparing }
TbScalableFitWidthStrategy >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	^ true
]

{ #category : #comparing }
TbScalableFitWidthStrategy >> hash [
	^ self class hash
]

{ #category : #scale }
TbScalableFitWidthStrategy >> scale: aContentElement within: aScalableElement [
	"Compute and return a scale factor of a content element within scalable element.
	Note: I am used during measurement pass, so you must only rely on measured bounds!"
	<return: #Number>
	| aMeasuredExtent |
	
	aMeasuredExtent := aContentElement measuredExtent.
	(aMeasuredExtent x * aMeasuredExtent y) isZero
		ifTrue: [ ^ 1.0 ].
	
	^ (aScalableElement measuredWidth / aMeasuredExtent x)
]
