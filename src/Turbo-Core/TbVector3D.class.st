"
I represent a 3D Euclidean vector

https://en.wikipedia.org/wiki/Euclidean_vector

Instance creation:

	vector := (2, 3, 5)
"
Class {
	#name : 'TbVector3D',
	#superclass : 'TbVector',
	#instVars : [
		'x',
		'y',
		'z'
	],
	#category : 'Turbo-Core-Basic-Math',
	#package : 'Turbo-Core',
	#tag : 'Basic-Math'
}

{ #category : 'arithmetic' }
TbVector3D >> * aScalar [
	"Multiplicate me by a given scalar (it can be a number, point, or vector)"
	<return: #TbVector>
	
	^ aScalar scalarMultiplicate3D: self
]

{ #category : 'arithmetic' }
TbVector3D >> + anotherVector [
	"Perform an addition of a given vector and me"
	<return: #TbVector>

	^ anotherVector add3D: self
]

{ #category : 'arithmetic' }
TbVector3D >> - anotherVector [
	"Perform a subtraction of a given vector from me and return a resulting vector"
	<return: #TbVector>

	^ anotherVector subtract3D: self
]

{ #category : 'comparing' }
TbVector3D >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].

	^ self x = anObject x
		and: [ self y = anObject y
			and: [ self z = anObject z ] ]
]

{ #category : 'converting' }
TbVector3D >> adaptToNumber: aNumber andSend: aSelector [
	"If I am involved in arithmetic with an Integer, convert it to a Vector of the same dimension"
	<return: #TbVector>

	^ (TbVector x: aNumber y: aNumber z: aNumber) perform: aSelector with: self
]

{ #category : 'arithmetic' }
TbVector3D >> add2D: aVector2D [
	"Add me from a given 2D vector"
	<return: #TbVector>

	^ self class
		x: aVector2D x + self x
		y: aVector2D y + self y
		z: self z
]

{ #category : 'arithmetic' }
TbVector3D >> add3D: aVector3D [
	"Add me to a given 3D vector"
	<return: #TbVector>

	^ self class
		x: aVector3D x + self x
		y: aVector3D y + self y
		z: aVector3D z + self z
]

{ #category : 'converting' }
TbVector3D >> asScale3D [
	"Return a 3D vector representing a scale factor"
	<return: #BlVector3D>
	
	^ self
]

{ #category : 'converting' }
TbVector3D >> asTranslate3D [
	"Return a 3D vector representing a translation vector"
	<return: #TbVector3D>

	^ self
]

{ #category : 'comparing' }
TbVector3D >> hash [
	^ (self x hash bitXor: self y hash) bitXor: self z hash
]

{ #category : 'vector functions' }
TbVector3D >> length [
	<return: #Number>
	
	^ ((self x * self x) + (self y * self y) + (self z * self z)) sqrt
]

{ #category : 'vector functions' }
TbVector3D >> negated [
	<return: #TbVector>

	^ TbVector
		x: self x negated
		y: self y negated
		z: self z negated
]

{ #category : 'vector functions' }
TbVector3D >> normalized [
	<return: #TbVector>
	| aLength |
	
	aLength := self length.
	self
		assert: [ aLength isZero not ]
		description: [ 'It is not possible to normalize a zero vector' ].

	^ self class
		x: self x / aLength
		y: self y / aLength
		z: self z / aLength
]

{ #category : 'printing' }
TbVector3D >> printOn: aStream [
	aStream
		nextPut: $(;
		nextPutAll: self x asString;
		nextPutAll: ', ';
		nextPutAll: self y asString;
		nextPutAll: ', ';
		nextPutAll: self z asString;
		nextPut: $)
]

{ #category : 'arithmetic' }
TbVector3D >> subtract2D: aVector2D [
	"Substruct me from a given 2D vector"
	<return: #TbVector>

	^ self class
		x: aVector2D x - self x
		y: aVector2D y - self y
		z: self z negated
]

{ #category : 'arithmetic' }
TbVector3D >> subtract3D: aVector3D [
	"Substruct me from a given 3D vector"
	<return: #TbVector>

	^ self class
		x: aVector3D x - self x
		y: aVector3D y - self y
		z: aVector3D z - self z
]

{ #category : 'accessing' }
TbVector3D >> x [
	<return: #Number>

	^ x
]

{ #category : 'initialization' }
TbVector3D >> x: aX y: aY z: aZ [
	x := aX.
	y := aY.
	z := aZ
]

{ #category : 'accessing' }
TbVector3D >> y [
	<return: #Number>

	^ y
]

{ #category : 'accessing' }
TbVector3D >> z [
	<return: #Number>

	^ z
]
