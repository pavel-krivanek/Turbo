"
Is sent when element's background changes.

Example:

[[[
| element |

element := BlElement new.
element when: BlElementBackgroundChangedEvent do: [ self inform: 'Background changed' ].
element background: Color blue
]]]
"
Class {
	#name : #TbElementBackgroundChangedEvent,
	#superclass : #TbElementEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbElementBackgroundChangedEvent >> sendTo: anObject [
	anObject elementBackgroundChanged: self
]
