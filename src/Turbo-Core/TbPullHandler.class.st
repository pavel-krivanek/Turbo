"
I add an ability to drag (pull) any arbitrary element within its direct parent by requesting position change.
Note, that some layout do not allow elements to have custom positions which means I have no effect.

Example:

[[[
| element |		

element := BlElement new.
element background: Color red.
element size: 75@75.
element addEventHandler: BlPullHandler new.	
]]]
"
Class {
	#name : 'TbPullHandler',
	#superclass : 'TbElementEventListener',
	#instVars : [
		'originalPosition',
		'dragStartPosition'
	],
	#category : 'Turbo-Core-Utilities - Drag&Drop',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Drag&Drop'
}

{ #category : 'dnd handlers' }
TbPullHandler >> dragEndEvent: anEvent [
	anEvent consumed: true
]

{ #category : 'dnd handlers' }
TbPullHandler >> dragEvent: anEvent [
	| dragPosition dragDelta |

	dragPosition := anEvent currentTarget globalPointToParent: anEvent position.
	dragDelta := dragPosition - (dragStartPosition ifNil: [ dragStartPosition := dragPosition ]).

	anEvent currentTarget relocate: ((originalPosition ifNil: [ originalPosition := anEvent currentTarget position ]) + dragDelta).

	anEvent consumed: true
]

{ #category : 'dnd handlers' }
TbPullHandler >> dragStartEvent: anEvent [
	anEvent consumed: true.

	"drag start position in parent"
	dragStartPosition := anEvent currentTarget globalPointToParent: anEvent position.

	"element position in parent"
	originalPosition := anEvent currentTarget position.

]
