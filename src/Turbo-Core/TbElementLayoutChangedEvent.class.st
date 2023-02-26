"
Is sent when element's layout changes.

Example:

[[[
| element |

element := BlElement new.
element when: BlElementLayoutChangedEvent do: [ self inform: 'Layout changed' ].
element layout: BlBasicLayout new
]]]
"
Class {
	#name : #TbElementLayoutChangedEvent,
	#superclass : #TbElementEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbElementLayoutChangedEvent >> sendTo: anObject [
	anObject elementLayoutChangedChanged: self
]
