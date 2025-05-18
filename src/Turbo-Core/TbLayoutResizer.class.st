Class {
	#name : 'TbLayoutResizer',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : 'Turbo-Core-Layouts-Support',
	#package : 'Turbo-Core',
	#tag : 'Layouts-Support'
}

{ #category : 'instance creation' }
TbLayoutResizer class >> exact: aNumber [
	^ TbLayoutExactResizer size: aNumber
]

{ #category : 'instance creation' }
TbLayoutResizer class >> fitContent [
	^ TbLayoutFitContentResizer uniqueInstance
]

{ #category : 'instance creation' }
TbLayoutResizer class >> fitContentLimited [
	^ TbLayoutFitContentLimitedResizer uniqueInstance
]

{ #category : 'instance creation' }
TbLayoutResizer class >> matchParent [
	^ TbLayoutMatchParentResizer uniqueInstance
]

{ #category : 'comparing' }
TbLayoutResizer >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : 'comparing' }
TbLayoutResizer >> hash [
	^ self class hash
]

{ #category : 'controlling' }
TbLayoutResizer >> ifExact: aBlock [
	^ self
]

{ #category : 'controlling' }
TbLayoutResizer >> ifFitContent: aBlock [
	^ self
]

{ #category : 'controlling' }
TbLayoutResizer >> ifMatchParent: aBlock [
	^ self
]

{ #category : 'testing' }
TbLayoutResizer >> isExact [
	^ false
]

{ #category : 'testing' }
TbLayoutResizer >> isFitContent [
	^ false
]

{ #category : 'testing' }
TbLayoutResizer >> isMatchParent [
	^ false
]

{ #category : 'double dispatching' }
TbLayoutResizer >> measurementAtMostWith: aNumber [
	^ self subclassResponsibility
]

{ #category : 'double dispatching' }
TbLayoutResizer >> measurementExactlyWith: aNumber [
	^ self subclassResponsibility
]

{ #category : 'double dispatching' }
TbLayoutResizer >> measurementUnspecifiedWith: aNumber [
	^ self subclassResponsibility
]
