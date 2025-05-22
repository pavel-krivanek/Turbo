Class {
	#name : 'TbRayTest',
	#superclass : 'TestCase',
	#category : 'Turbo-Tests-Math',
	#package : 'Turbo-Tests',
	#tag : 'Math'
}

{ #category : 'tests' }
TbRayTest >> testDistanceToLine [
    | ray p |
    p := TbPoint2D x: 0 y: 5.
    ray := TbRay from: (0@0) directed: (TbVector x: 1 y: 0).
    "Distance from (0,5) to x-axis = 5"
    self assert: (ray distanceTo: p) equals: 5.
]

{ #category : 'tests' }
TbRayTest >> testDistanceWithZeroVector [
    | ray p |
    ray := TbRay new.
    p := TbPoint2D x: 3 y: 4.
    "Default point is 0@0, zero vector -> distance is 5"
    self assert: (ray distanceTo: p) equals: 5.
]

{ #category : 'tests' }
TbRayTest >> testFromDirected [
    | p v ray |
    p := TbPoint2D x: 1 y: 2.
    v := TbVector x: 3 y: 4.
    ray := TbRay from: p directed: v.
    self assert: ray point equals: p.
    self assert: ray vector equals: v.
]

{ #category : 'tests' }
TbRayTest >> testInitializeDefault [
    | ray |
    ray := TbRay new.
    self assert: ray point equals: (0@0).
    self assert: ray vector equals: (TbVector x: 0 y: 0).
]

{ #category : 'tests' }
TbRayTest >> testPointAndVectorAccessors [
    | ray p v |
    ray := TbRay new.
    p := TbPoint2D x: 5 y: 6.
    v := TbVector x: -1 y: -2.
    ray point: p; vector: v.
    self assert: ray point equals: p.
    self assert: ray vector equals: v.
]

{ #category : 'tests' }
TbRayTest >> testPrintOnContainsArrow [
    | ray p v stream |
    p := TbPoint2D x: 1 y: 2.
    v := TbVector x: 3 y: 4.
    ray := TbRay from: p directed: v.
    stream := WriteStream on: String new.
    ray printOn: stream.
    self assert: (stream contents includesSubstring: '->').
]

{ #category : 'tests' }
TbRayTest >> testProjectionOntoVerticalLine [
    | ray p proj |
    ray := TbRay from: (1@2) directed: (TbVector x: 0 y: 1).
    p := TbPoint2D x: 4 y: 5.
    proj := ray projection: p.
    "Projection onto line x=1 yields (1,5)"
    self assert: proj x equals: 1.
    self assert: proj y equals: 5.
]

{ #category : 'tests' }
TbRayTest >> testProjectionWithZeroVector [
    | ray p |
    ray := TbRay new.
    p := TbPoint2D x: 3 y: 4.
    "Zero vector: projection is starting point"
    self assert: (ray projection: p) equals: (0@0).
]
