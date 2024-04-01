"
I represent an abstract dimension-less vector.
My subclasses implement API for concrete spaces (2D, 3D, etc).

I define basic vector function such as:
	- length
	- negated
	- normalized
	
Instance creation examples:

Create a 2D vector:

	BlVector x: 10 y: 20
	or
	(10, 20)
	
Create a 3D vector:

	BlVector x: 10 y: 20 z: 30
	or
	(10, 20, 30)
"
Class {
	#name : #TbVector,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#classInstVars : [
		'zAxis',
		'xAxis',
		'yAxis',
		'zero',
		'one'
	],
	#category : #'Turbo-Core-Basic-Math'
}

{ #category : #cleanup }
TbVector class >> cleanUp [
	super cleanUp.
	
	xAxis := nil.
	yAxis := nil.
	zAxis := nil.
	zero := nil.
	one := nil
]

{ #category : #'instance creation' }
TbVector class >> one [
	"Return a vector with all components being ones"
	<return: #BlVector>
	
	^ one ifNil: [ one := self x: 1 y: 1 z: 1 ]
]

{ #category : #'instance creation' }
TbVector class >> x: aX y: aY [
	^ TbVector2D new x: aX y: aY
]

{ #category : #'instance creation' }
TbVector class >> x: aX y: aY z: aZ [
	^ TbVector3D new x: aX y: aY z: aZ
]

{ #category : #'instance creation' }
TbVector class >> xAxis [
	"Return a vector that corresponds to x-axis"
	<return: #BlVector>
	
	^ xAxis ifNil: [ xAxis := self x: 1 y: 0 z: 0 ]
]

{ #category : #'instance creation' }
TbVector class >> yAxis [
	"Return a vector that corresponds to y-axis"
	<return: #BlVector>
	
	^ yAxis ifNil: [ yAxis := self x: 0 y: 1 z: 0 ]
]

{ #category : #'instance creation' }
TbVector class >> zAxis [
	"Return a vector that corresponds to z-axis"
	<return: #BlVector>
	
	^ zAxis ifNil: [ zAxis := self x: 0 y: 0 z: 1 ]
]

{ #category : #'instance creation' }
TbVector class >> zero [
	"Return a vector of zero length"
	<return: #BlVector>
	
	^ zero ifNil: [ zero := self x: 0 y: 0 z: 0 ]
]

{ #category : #arithmetic }
TbVector >> * aScalar [
	"Multiplicate me by a given scalar (it can be a number, point, or vector)"
	<return: #BlVector>
	
	^ self subclassResponsibility
]

{ #category : #arithmetic }
TbVector >> + anotherVector [
	"Perform an addition of a given vector and me"
	<return: #BlVector>

	^ self subclassResponsibility
]

{ #category : #arithmetic }
TbVector >> - anotherVector [
	"Perform a subtraction of a given vector from me and return a resulting vector"
	<return: #BlVector>

	^ self subclassResponsibility
]

{ #category : #comparing }
TbVector >> = anObject [
	^ self subclassResponsibility
]

{ #category : #arithmetic }
TbVector >> add2D: aVector2D [
	"Add me to a given 2D vector"
	<return: #BlVector>

	^ self subclassResponsibility
]

{ #category : #arithmetic }
TbVector >> add3D: aVector3D [
	"Add me to a given 3D vector"
	<return: #BlVector>

	^ self subclassResponsibility
]

{ #category : #converting }
TbVector >> asBlocVector [
	<return: #BlVector>

	^ self
]

{ #category : #converting }
TbVector >> asScale3D [
	"Return a 3D vector representing a scale factor"
	<return: #BlVector3D>
	
	^ self subclassResponsibility
]

{ #category : #converting }
TbVector >> asTranslate3D [
	"Return a 3D vector representing a translation vector"
	<return: #BlVector3D>

	^ self subclassResponsibility
]

{ #category : #arithmetic }
TbVector >> dotProduct2D: anotherVector [
	<return: #Number>
	
	^ self subclassResponsibility
]

{ #category : #arithmetic }
TbVector >> dotProduct: anotherVector [
	<return: #Number>
	
	^ self subclassResponsibility
]

{ #category : #comparing }
TbVector >> hash [
	^ self subclassResponsibility
]

{ #category : #testing }
TbVector >> isParallel: aBlVector [
	<return: #Boolean>

	^ (self dotProduct: aBlVector) abs closeTo: 1
]

{ #category : #testing }
TbVector >> isZero [
	<return: #Boolean>
	
	^ self length isZero
]

{ #category : #'vector functions' }
TbVector >> length [
	<return: #Number>
	
	^ self subclassResponsibility
]

{ #category : #'vector functions' }
TbVector >> negated [
	<return: #BlVector>

	^ self subclassResponsibility
]

{ #category : #'vector functions' }
TbVector >> normal [
	"Find a unit vector rotated clockwise. For the zero length vector return (-1, 0)"
	<return: #BlVector>
	
	^ self subclassResponsibility
]

{ #category : #'vector functions' }
TbVector >> normalized [
	<return: #BlVector>

	^ self subclassResponsibility
]

{ #category : #'vector functions' }
TbVector >> rotateBy: anAngleInRadians [
	self rotateBy: anAngleInRadians about: 0@0
]

{ #category : #'vector functions' }
TbVector >> rotateBy: anAngleInRadians about: aCenterPoint [ 
	self subclassResponsibility
]

{ #category : #arithmetic }
TbVector >> scalarMultiplicate2D: aVector2D [
	"Perform a scalar multiplication of a given 2D vector by me"
	<return: #BlVector>

	^ self subclassResponsibility
]

{ #category : #arithmetic }
TbVector >> scalarMultiplicate3D: aVector3D [
	"Perform a scalar multiplication of a given 3D vector by me"
	<return: #BlVector>

	^ self subclassResponsibility
]

{ #category : #arithmetic }
TbVector >> sign [
	^ self subclassResponsibility
]

{ #category : #arithmetic }
TbVector >> subtract2D: aVector2D [
	"Substruct me from a given 2D vector"
	<return: #BlVector>

	^ self subclassResponsibility
]

{ #category : #arithmetic }
TbVector >> subtract3D: aVector3D [
	"Substruct me from a given 3D vector"
	<return: #BlVector>
	
	^ self subclassResponsibility
]
