"
I am an empty chain that does not dispatch events.
Basically, I implement a null object pattern and used as next or previous element in dispatcher chain if there is none
"
Class {
	#name : 'TbEventDispatcherEmptyChain',
	#superclass : 'TbEventDispatcherChain',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Turbo-Core-Events-Handling',
	#package : 'Turbo-Core',
	#tag : 'Events-Handling'
}

{ #category : 'cleanup' }
TbEventDispatcherEmptyChain class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : 'accessing' }
TbEventDispatcherEmptyChain class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : 'api - event managing' }
TbEventDispatcherEmptyChain >> dispatchEvent: anEvent [
	^ anEvent
]

{ #category : 'api - adding' }
TbEventDispatcherEmptyChain >> withNext: aBlEventDispatcher [
	^ TbEventDispatcherChain with: aBlEventDispatcher
]
