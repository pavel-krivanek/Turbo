Class {
	#name : 'TbFlowLayoutPriorityQueueNode',
	#superclass : 'Object',
	#instVars : [
		'value',
		'priority',
		'queueIndex',
		'insertionIndex'
	],
	#category : 'Turbo-Layout-Flow-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Flow-Utilities'
}

{ #category : 'converting' }
TbFlowLayoutPriorityQueueNode >> asAssociation [
	^ self priority -> self value
]

{ #category : 'accessing' }
TbFlowLayoutPriorityQueueNode >> insertionIndex [
	^ insertionIndex
]

{ #category : 'accessing' }
TbFlowLayoutPriorityQueueNode >> insertionIndex: anObject [
	insertionIndex := anObject
]

{ #category : 'printing' }
TbFlowLayoutPriorityQueueNode >> printOn: aStream [
	self asAssociation printOn: aStream
]

{ #category : 'accessing' }
TbFlowLayoutPriorityQueueNode >> priority [
	^ priority
]

{ #category : 'accessing' }
TbFlowLayoutPriorityQueueNode >> priority: anObject [
	priority := anObject
]

{ #category : 'accessing' }
TbFlowLayoutPriorityQueueNode >> queueIndex [
	^ queueIndex
]

{ #category : 'accessing' }
TbFlowLayoutPriorityQueueNode >> queueIndex: anObject [
	queueIndex := anObject
]

{ #category : 'accessing' }
TbFlowLayoutPriorityQueueNode >> value [
	^ value
]

{ #category : 'accessing' }
TbFlowLayoutPriorityQueueNode >> value: anObject [
	value := anObject
]
