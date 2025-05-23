Class {
	#name : 'TbTaskQueue',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'tasks',
		'lock'
	],
	#category : 'Turbo-Core-Space-Support',
	#package : 'Turbo-Core',
	#tag : 'Space-Support'
}

{ #category : 'private' }
TbTaskQueue >> critical: aBlock [
	^ lock critical: aBlock
]

{ #category : 'api - enqueue' }
TbTaskQueue >> dequeue: aBlTask [	
	self
		assert: [ aBlTask isNotNil ]
		description: [ 'Task must not be nil' ].

	lock critical: [ tasks := tasks copyWithout: aBlTask ]
]

{ #category : 'api - enqueue' }
TbTaskQueue >> enqueue: aBlTask [	
	self
		assert: [ aBlTask isNotNil ]
		description: [ 'Task must not be nil' ].

	lock critical: [
		self
			assert: [ (tasks includes: aBlTask) not ]
			description: [ 'Task must not exist' ].
		
		tasks := tasks copyWith: aBlTask ]
]

{ #category : 'api - enqueue' }
TbTaskQueue >> enqueueAll: aCollectionOfBlTask [	
	self
		assert: [ aCollectionOfBlTask isNotNil ]
		description: [ 'Tasks must not be nil' ].

	lock critical: [
		self
			assert: [ (tasks includesAny: aCollectionOfBlTask) not ]
			description: [ 'Tasks must not exist' ].
		
		tasks := tasks, aCollectionOfBlTask ]
]

{ #category : 'api - enqueue' }
TbTaskQueue >> enqueueFrom: aBlTaskQueue [
	self
		assert: [ aBlTaskQueue isNotNil ]
		description: [ 'Queue to transfer must not be nil' ].

	aBlTaskQueue critical: [
		self enqueueAll: aBlTaskQueue tasks.
		aBlTaskQueue flush ]
]

{ #category : 'api - enqueue' }
TbTaskQueue >> flush [
	^ lock critical: [
		| theTasks |
		theTasks := tasks.
		tasks := #().
		theTasks ]
]

{ #category : 'initialization' }
TbTaskQueue >> initialize [
	super initialize.
	
	tasks := Array new.
	lock := Monitor new
]

{ #category : 'api - running' }
TbTaskQueue >> run [
	| theTasks |
	
	lock critical: [
		"We store reference to tasks Array because it is possible
		that a random task is removed while enumerating a collection"
		theTasks := tasks.
		tasks := #() ].

	"since we have an immutble reference to original array, there is need to execute task within a lock"
	theTasks do: [ :aTask | aTask run ]
]

{ #category : 'api - accessing' }
TbTaskQueue >> tasks [
	"Return a new collection instance holding all my tasks"
	| theTasks |
		
	lock critical: [
		"We store reference to tasks Array because it is possible
		that a random task is removed while enumerating a collection"
		theTasks := tasks ].
	
	^ theTasks
]
