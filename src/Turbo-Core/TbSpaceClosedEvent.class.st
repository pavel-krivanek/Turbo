"
I am sent by a space after it is closed.

Example:

[[[
space := BlSpace new.
space
	addEventHandlerOn: BlSpaceClosedEvent
	do: [ self inform: 'Space closed' ].
space show
]]]
"
Class {
	#name : #TbSpaceClosedEvent,
	#superclass : #TbSpaceEvent,
	#instVars : [
		'space'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #accessing }
TbSpaceClosedEvent >> space [
	<return: #TbSpace>

	^ space
]

{ #category : #accessing }
TbSpaceClosedEvent >> space: aSpace [
	space := aSpace
]
