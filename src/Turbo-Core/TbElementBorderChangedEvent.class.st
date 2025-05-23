"
Is sent when element's border changes.

Example:

[[[
| element |

element := BlElement new.
element when: BlElementBorderChangedEvent do: [ self inform: 'Border changed' ].
element border: (BlBorder paint: Color blue width: 20)
]]]
"
Class {
	#name : 'TbElementBorderChangedEvent',
	#superclass : 'TbElementEvent',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'sending' }
TbElementBorderChangedEvent >> sendTo: anObject [
	anObject elementBorderChanged: self
]
