Class {
	#name : 'TbEventDispatcher',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : 'Turbo-Core-Events-Handling',
	#package : 'Turbo-Core',
	#tag : 'Events-Handling'
}

{ #category : 'api - event managing' }
TbEventDispatcher >> dispatchEvent: anEvent [
	<return: #BlEvent>

	^ self dispatchEvent: anEvent next: TbEventDispatcherChain empty
]

{ #category : 'api - event managing' }
TbEventDispatcher >> dispatchEvent: anEvent next: aBlEventDispatcherChain [
	<return: #BlEvent>

	"Default implementation just dispaches to the next dispatcher in a chain"
	aBlEventDispatcherChain dispatchEvent: anEvent.

	^ anEvent
]

{ #category : 'api - accessing' }
TbEventDispatcher >> handlersDo: aBlock [
	"Evaulate a given block with every event handler as an argument"
]

{ #category : 'api - accessing' }
TbEventDispatcher >> type [
	"Return the type name of the dispatcher. Might be used by IDE extensions"
	<return: #String>

	^ 'Silent'
]

{ #category : 'api - event managing' }
TbEventDispatcher >> wantsEvent: anEvent [
	"Return true if my current conditions allow me to dispatch a given event, false otherwise.
	Default implementation always returns true. Override me to customize the behaviour"
	<return: #Boolean>

	^ true
]
