"
I represent a path of elements to the actual focused element.

Even if  ""parent <-> child"" connection between elements is lost due to removing we still have all the necessary information to send FocusOut events.

I am used by ${class:BlFocusProcessor}$ to properly send events
"
Class {
	#name : 'TbFocusChain',
	#superclass : 'DoubleLinkedList',
	#category : 'Turbo-Core-Space-Support',
	#package : 'Turbo-Core',
	#tag : 'Space-Support'
}

{ #category : 'instance creation' }
TbFocusChain class >> of: anElement [
	| aChain |
	
	aChain := self new.
	anElement withAllParentsDo: [ :aParent |
		aChain addFirst: aParent ].

	^ aChain
]

{ #category : 'enumerating' }
TbFocusChain >> leafsDo: aBlock [
	"Evaluate a given block with all leaf elements in the chain starting from the focused element in reverse order"
	| previousElementHadParent |

	previousElementHadParent := false.
	self reverseDo: [ :anElement |
		previousElementHadParent
			ifFalse: [ aBlock value: anElement ].
		previousElementHadParent := anElement value hasParent ]
]
