"
A ray is a line with an endpoint that extends infinitely in one direction.

I consist of a starting ===#point=== and a direction ===#vector===
"
Class {
	#name : 'TbRay',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'point',
		'vector'
	],
	#category : 'Turbo-Core-Basic-Math',
	#package : 'Turbo-Core',
	#tag : 'Basic-Math'
}

{ #category : 'instance creation' }
TbRay class >> from: aPoint directed: aBlVector [
	<return: #BlRay>

	^ self new
		point: aPoint;
		vector: aBlVector
]

{ #category : 'api - vector functions' }
TbRay >> distanceTo: aPoint [
	"The distance (or perpendicular distance) from a point to a line is the shortest distance from a fixed point to any point on a fixed infinite line in Euclidean geometry. It is the length of the line segment which joins the point to the line and is perpendicular to the line.
	(https://en.wikipedia.org/wiki/Distance_from_a_point_to_a_line)
	
	Line defined by two points:
	If the line passes through two points P1=(x1,y1) and P2=(x2,y2) then the distance of (x0,y0) from the line is:

	distance = abs( (y2-y1)*x1 - (x2-x1)*y0 + x2*y1 - y2*x1 ) / sqrt( (y2-y1)^2 + (x2-x1)^2 )

	"
	<return: #Number>
	
	self vector isZero
		ifTrue: [ ^ aPoint asPoint distanceTo: self point ].
	
	^ ((self vector y * aPoint x) - (self vector x * aPoint y) + (self point y * (self point x + self vector x)) - (self point x * (self point y + self vector y))) abs / self vector length
]

{ #category : 'initialization' }
TbRay >> initialize [
	super initialize.
	
	point := 0@0.
	vector := TbVector x: 0 y: 0.
]

{ #category : 'api - accessing' }
TbRay >> point [
	<return: #Point>

	^ point
]

{ #category : 'api - accessing' }
TbRay >> point: aPoint [
	point := aPoint
]

{ #category : 'printing' }
TbRay >> printOn: aStream [
	aStream
		print: self point;
		nextPutAll: ' -> ';
		print: self vector
]

{ #category : 'api - vector functions' }
TbRay >> projection: aPoint [
	"Return a projection of a given point on this ray"
	<return: #Point>
	| aNormalizedDirection |

	"
	P - point
	D - direction of line (unit length)
	A - point in line

	X - base of the perpendicular line

	    P
	   /|
	  / |
	 /  v
	A---X----->D

	(P-A).D == |X-A|

	X == A + ((P-A).D)D
	"
	
	self vector isZero
		ifTrue: [ ^ self point ].
	
	aNormalizedDirection := self vector normalized.
	
	^ self point + (((aPoint asPoint - self point asPoint) asBlocVector dotProduct: aNormalizedDirection) * aNormalizedDirection)
]

{ #category : 'api - accessing' }
TbRay >> vector [
	<return: #TbVector>

	^ vector
]

{ #category : 'api - accessing' }
TbRay >> vector: aBlVector [
	vector := aBlVector
]
