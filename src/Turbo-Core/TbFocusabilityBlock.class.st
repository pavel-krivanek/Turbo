Class {
	#name : #TbFocusabilityBlock,
	#superclass : #TbFocusability,
	#category : #'Turbo-Core-Basic-Properties'
}

{ #category : #focus }
TbFocusabilityBlock >> focusables: anOrderedCollection along: aBlFocusSearchDirection of: anElement [
	"Block descendants and only add anElement"

	anElement isFocusable
		ifTrue: [ anOrderedCollection add: anElement ]
]
