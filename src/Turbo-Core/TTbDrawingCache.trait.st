"
I add support of drawing cache to any element.

Simple use me in a class definition and implement explicitly required methods from private accessing protocol
"
Trait {
	#name : #TTbDrawingCache,
	#category : #'Turbo-Core-Utilities - Drawing Cache'
}

{ #category : #'private - accessing' }
TTbDrawingCache >> cachedSurface [
	^ self explicitRequirement
]

{ #category : #'private - accessing' }
TTbDrawingCache >> cachedSurface: aSurface [
	self explicitRequirement
]

{ #category : #'private - accessing' }
TTbDrawingCache >> damageReported [
	^ self explicitRequirement
]

{ #category : #'private - accessing' }
TTbDrawingCache >> damageReported: aBoolean [
	self explicitRequirement
]

{ #category : #'change reporting' }
TTbDrawingCache >> invalidRect: aBlBounds from: anElement [
	"we should only optimize it for children. I myself should invalidate as usually.
	The problem is that if we optimize for myself, then the second invalidation after
	position / extent change will be ignored which leads to redraw problems"
	anElement ~~ self
		ifTrue: [ ^ super invalidRect: aBlBounds from: anElement ].
	
	"we compare with true because it is nil by default (I am coming from a Trait)"
	self damageReported == true
		ifTrue: [ ^ self ].

	super invalidRect: (self invalidationBounds: self class invalidationBounds) from: anElement.

	self damageReported: true.
	
	self releaseCaches
]

{ #category : #'children hooks' }
TTbDrawingCache >> onRemovedFromSceneGraph [
	super onRemovedFromSceneGraph.

	self releaseCaches
]

{ #category : #'hooks - geometry' }
TTbDrawingCache >> onTransformationInSpaceChanged [
	super onTransformationInSpaceChanged.
	
	self releaseCaches
]

{ #category : #initialization }
TTbDrawingCache >> releaseCaches [
	self cachedSurface ifNotNil: #release.
	self cachedSurface: nil
]

{ #category : #'private - accessing' }
TTbDrawingCache >> session [
	^ self explicitRequirement
]

{ #category : #'private - accessing' }
TTbDrawingCache >> session: aSession [
	self explicitRequirement
]
