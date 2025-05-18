"
Is sent by an element after it is removed from the parent.

Note: I am not sent when element is detached!

Example:

[[[
| child parent |

child := BlElement new.
child when: BlElementRemovedEvent do: [ self inform: 'Removed from parent' ].

parent := BlElement new.
parent addChild: child.
parent removeChild: child
]]]
"
Class {
	#name : 'TbElementRemovedEvent',
	#superclass : 'TbElementEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbElementRemovedEvent >> sendTo: anObject [
	anObject elementRemoved: self
]
