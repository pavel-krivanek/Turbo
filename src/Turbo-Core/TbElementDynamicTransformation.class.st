"
I am dynamic element transformation in the sense that my transformation matrix may actually depend on some element properties such as #extent or #position.

It means that matrix computation is performed only when requested taking owner element into account.
This also means that the matrix dimension (2D or 3D) should be determined dynamically based on inner transformations
"
Class {
	#name : #TbElementDynamicTransformation,
	#superclass : #TbElementTransformation,
	#category : #'Turbo-Core-Basic-Transformations'
}

{ #category : #computation }
TbElementDynamicTransformation >> computeMatrix [
	"I perform a matrix computation assuming that matrix is initialized with
	a correct type (2D or 3D) and that it is identity"

	self subclassResponsibility
]

{ #category : #initialization }
TbElementDynamicTransformation >> defaultMatrix2D [
	^ TbMatrix2D new
]

{ #category : #initialization }
TbElementDynamicTransformation >> defaultMatrix3D [
	^ TbMatrix3D new
]

{ #category : #private }
TbElementDynamicTransformation >> ensure2D [
	matrix := self defaultMatrix2D
]

{ #category : #private }
TbElementDynamicTransformation >> ensure3D [
	matrix := self defaultMatrix3D
]

{ #category : #private }
TbElementDynamicTransformation >> ensureMatrix [
	self hasMatrix
		ifTrue: [ ^ self ].
	self is2D
		ifTrue: [ self ensure2D ]
		ifFalse: [ self ensure3D ].
	self computeMatrix
]

{ #category : #private }
TbElementDynamicTransformation >> hasMatrix [
	"Return true if any of 2D or 3D matrices exist, false otherwise.
	Note: I am useful for fast exits"
	<return: #Boolean>
	
	^ matrix isNotNil 
]

{ #category : #accessing }
TbElementDynamicTransformation >> matrix [
	<return: #BlMatrix>

	self ensureMatrix.
	^ matrix
]
