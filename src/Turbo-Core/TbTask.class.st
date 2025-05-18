Class {
	#name : 'TbTask',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : 'Turbo-Core-Space-Support',
	#package : 'Turbo-Core',
	#tag : 'Space-Support'
}

{ #category : 'hooks' }
TbTask >> onEnqueued: aBlSpace [
	"Is self when a task is enqueued in a space.
	It gives subclasses a possibility to synchronize time with the space"
]

{ #category : 'hooks' }
TbTask >> onEnqueuedInElement: aBlElement [
	"Is sent when a task is enqueued in a element.
	It gives subclasses a possibility to re-enqueue themselves in the same element"
]

{ #category : 'api - running' }
TbTask >> run [
	self subclassResponsibility
]

{ #category : 'api - running' }
TbTask >> value [
	"To support defer:"
	self run
]
