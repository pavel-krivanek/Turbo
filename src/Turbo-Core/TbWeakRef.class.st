Class {
	#name : #TbWeakRef,
	#superclass : #WeakArray,
	#type : #weak,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : #'Turbo-Core-Basic-Support'
}

{ #category : #'as yet unclassified' }
TbWeakRef class >> new [
	^ self new: 1
]

{ #category : #'as yet unclassified' }
TbWeakRef >> value [
	^ self at: 1 ifAbsent: [ nil ]
]

{ #category : #'as yet unclassified' }
TbWeakRef >> value: anObject [
	self at:1 put: anObject
]
