Class {
	#name : #TbFocusabilityBefore,
	#superclass : #TbFocusability,
	#category : #'Turbo-Core-Basic-Properties'
}

{ #category : #focus }
TbFocusabilityBefore >> focusables: anOrderedCollection along: aBlFocusSearchDirection of: anElement [
	"anElement should get focus before descendants"

	anElement isFocusable
		ifTrue: [ anOrderedCollection add: anElement ].
	
	anElement children
		select: [ :aChild | aChild isVisible ]
		thenDo: [ :aChild | aChild focusables: anOrderedCollection along: aBlFocusSearchDirection ].
		
	
]
