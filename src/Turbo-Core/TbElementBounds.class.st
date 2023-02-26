"
I represent rectangular bounds in a context of a reference element.
I define an api to convert element bounds from one coordinate system to other coordinate systems.

Reference element always corresponds to an element which was used to compute bounds
"
Class {
	#name : #TbElementBounds,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'referenceElement'
	],
	#category : #'Turbo-Core-Basic-Bounds'
}

{ #category : #converting }
TbElementBounds >> asRectangle [
	<return: #Rectangle>
	
	^ self subclassResponsibility
]

{ #category : #'geometry - accessing' }
TbElementBounds >> bottom [
	<return: #Number>

	^ self bounds bottom
]

{ #category : #'geometry - accessing' }
TbElementBounds >> bottomCenter [
	<return: #Point>

	^ self bounds bottomCenter
]

{ #category : #'geometry - accessing' }
TbElementBounds >> bottomLeft [
	<return: #Point>

	^ self bounds bottomLeft
]

{ #category : #'geometry - accessing' }
TbElementBounds >> bottomRight [
	<return: #Point>

	^ self right @ self bottom
]

{ #category : #accessing }
TbElementBounds >> bounds [
	<return: #BlBounds>
	
	^ self subclassResponsibility
]

{ #category : #'bounds conversion' }
TbElementBounds >> boundsInLocal: aBlBounds [
	"I load my local bounds in the given mutable bounds and return it.
	I do not rely on cache and always provide actual bounds.
	Local Bounds is nothing else than the bounds with origin point set to 0@0
	and with extent equal to my pure extent.
	Local Bounds property does not take effect or border into account.
	I am a part of internal api, use me with caution"
	<return: #BlBounds>

	^ aBlBounds
		left: 0
		top: 0
		corner: self extent;
		yourself
]

{ #category : #'geometry - accessing' }
TbElementBounds >> center [
	"Return a point representing a geometrical center of this bounds"
	<return: #Point>
	
	^ self bounds center
]

{ #category : #'geometry - accessing' }
TbElementBounds >> centerLeft [
	<return: #Point>

	^ self bounds centerLeft
]

{ #category : #'geometry - accessing' }
TbElementBounds >> centerRight [
	<return: #Point>

	^ self bounds centerRight
]

{ #category : #accessing }
TbElementBounds >> extent [
	"Return extent of current bounds"
	<return: #Point>
	
	^ self subclassResponsibility
]

{ #category : #'geometry - accessing' }
TbElementBounds >> height [
	<return: #Number>

	^ self extent y
]

{ #category : #'geometry bounds' }
TbElementBounds >> inChild: anElement [
	<return: #BlElementBounds>

	^ self subclassResponsibility
]

{ #category : #'geometry bounds' }
TbElementBounds >> inLocal [
	<return: #BlElementBounds>

	^ self subclassResponsibility
]

{ #category : #'geometry bounds' }
TbElementBounds >> inParent [
	<return: #BlElementBounds>

	^ self subclassResponsibility
]

{ #category : #'geometry bounds' }
TbElementBounds >> inParent: anElement [
	<return: #BlElementBounds>

	^ self subclassResponsibility
]

{ #category : #'geometry bounds' }
TbElementBounds >> inSpace [
	<return: #BlElementBounds>

	^ self subclassResponsibility
]

{ #category : #'geometry bounds' }
TbElementBounds >> inWindow [
	<return: #BlElementBounds>

	^ self subclassResponsibility
]

{ #category : #'geometry - accessing' }
TbElementBounds >> left [
	<return: #Number>

	^ self bounds left
]

{ #category : #'bounds conversion' }
TbElementBounds >> localBoundsToParent: aBounds [
	"In-place transform bounds from local coordinates to my parent's coordinates.
	Note, that I do not return a new rectangle and instead mutate provided one,
	so do not forget to send #asRectangle to given mutable rectangle in order to get
	immutable one that can be safely stored as instance variable."
	<return: #BlBounds>

	"first apply transformation if we have one"
	self referenceElement transformation transformBounds: aBounds.

	"then translate according to my position within the parent.
	Note, that an element might have a position even if it does not have a parent"
	aBounds translateBy: self referenceElement position.
	
	^ aBounds
]

{ #category : #'bounds conversion' }
TbElementBounds >> localBoundsToSpace: aBounds [
	"In-place transform bounds from local coordinates to space coordinates.
	Note, that I do not return a new rectangle and instead mutate provided one,
	so do not forget to send #asRectangle to given mutable rectangle in order to get
	immutable one that can be safely stored as instance variable."
	<return: #BlBounds>
	| aCurrentElement |

	aCurrentElement := self referenceElement.

	[
		"first apply transformation if we have one"
		aCurrentElement transformation transformBounds: aBounds.

		"then translate according to my position within the parent.
		Note, that an element might have a position even if it does not have a parent"
		aBounds translateBy: aCurrentElement position.
	]
	"we must evaluate a transformation block at least once even if there is no parent"
	doWhileTrue: [
		| hasParent |
		hasParent := aCurrentElement hasParent.
		hasParent ifTrue: [ aCurrentElement := aCurrentElement parent ].
		hasParent ].

	^ aBounds
]

{ #category : #'bounds conversion' }
TbElementBounds >> localBoundsToTransformed: aBounds [
	"In-place transform bounds from local coordinates to my parent's coordinates.
	Note, that I do not return a new rectangle and instead mutate provided one,
	so do not forget to send #asRectangle to given mutable rectangle in order to get
	immutable one that can be safely stored as instance variable."
	<return: #BlBounds>

	"first apply transformation if we have one"
	self referenceElement transformation transformBounds: aBounds.

	^ aBounds
]

{ #category : #accessing }
TbElementBounds >> position [
	"Return bounds position (an origin) as a Point"
	<return: #Point>
	
	^ self subclassResponsibility
	

]

{ #category : #printing }
TbElementBounds >> printOn: aStream [
	aStream print: self asRectangle
]

{ #category : #accessing }
TbElementBounds >> referenceElement [
	"Return a reference element that defines a coordinate system in which bounds are local.
	Reference element can not be nil"
	<return: #BlElement>
	self
		assert: [ referenceElement isNotNil ]
		description: [ 'Can not access not existing reference element' ].

	^ referenceElement
]

{ #category : #accessing }
TbElementBounds >> referenceElement: aBlElement [
	referenceElement := aBlElement
]

{ #category : #'geometry - accessing' }
TbElementBounds >> right [
	<return: #Number>

	^ self bounds right
]

{ #category : #'geometry - accessing' }
TbElementBounds >> top [
	<return: #Number>

	^ self bounds top
]

{ #category : #'geometry - accessing' }
TbElementBounds >> topCenter [
	<return: #Point>

	^ self bounds topCenter
]

{ #category : #'geometry - accessing' }
TbElementBounds >> topLeft [
	<return: #Point>

	^ self bounds topLeft
]

{ #category : #'geometry - accessing' }
TbElementBounds >> topRight [
	<return: #Point>

	^ self bounds topRight
]

{ #category : #'geometry bounds' }
TbElementBounds >> transformed [
	<return: #BlElementBounds>

	^ self subclassResponsibility
]

{ #category : #'geometry - accessing' }
TbElementBounds >> width [
	<return: #Number>

	^ self extent x
]
