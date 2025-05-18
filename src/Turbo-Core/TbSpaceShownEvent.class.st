"
I am sent by a space after it is shown.

Example:

[[[
space := BlSpace new.
space
	addEventHandlerOn: BlSpaceShownEvent
	do: [ self inform: 'Space shown' ].
space show
]]]

Note:
Behaves as SDL_WINDOWEVENT_SHOWN
"
Class {
	#name : 'TbSpaceShownEvent',
	#superclass : 'TbSpaceEvent',
	#instVars : [
		'space'
	],
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'accessing' }
TbSpaceShownEvent >> space [
	^ space
]

{ #category : 'accessing' }
TbSpaceShownEvent >> space: anObject [
	space := anObject
]
