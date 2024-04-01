"
I am the abstract class for event queue management.

"
Class {
	#name : #TbHostEventFetcher,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'eventQueue'
	],
	#category : #'Turbo-Core-Universe'
}

{ #category : #'event processing' }
TbHostEventFetcher >> enqueueEvent: aBlEvent [
	"Enqueue a given Bloc Event in the event queue.
	Do not use me directly, instead rely on #enqueueEvent: from HostSpace"

	eventQueue nextPut: aBlEvent
]

{ #category : #'event processing' }
TbHostEventFetcher >> fetchedEventsDo: aBlock [
	"Flush event queue and evaluate a given block with every queued event as argument"
	| theEvents |

	theEvents := LinkedList new.
	eventQueue flush: [ :anEvent | theEvents add: anEvent ].
	theEvents do: aBlock
]

{ #category : #'initialize-release' }
TbHostEventFetcher >> initialize [
	super initialize.

	eventQueue := WaitfreeQueue new
]
