"
Is sent by an element after it is added to the parent.

Note: I am not sent when element is re-attached!

Example:

[[[
| child parent |

child := BlElement new.
child when: BlElementAddedToParentEvent do: [ self inform: 'Added to parent' ].

parent := BlElement new.
parent addChild: child.
]]]
"
Class {
	#name : 'TbElementAddedToParentEvent',
	#superclass : 'TbElementEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbElementAddedToParentEvent >> sendTo: anObject [
	anObject elementAddedToParent: self
]
