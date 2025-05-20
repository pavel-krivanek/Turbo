Class {
	#name : 'TbPoint2D',
	#superclass : 'TbPoint',
	#instVars : [
		'x',
		'y'
	],
	#category : 'Turbo-Core-Basic-Math',
	#package : 'Turbo-Core',
	#tag : 'Basic-Math'
}

{ #category : 'instance creation' }
TbPoint2D class >> x: aX y: aY [

	^ self new x: aX y: aY
]

{ #category : 'comparing' }
TbPoint2D >> < aPoint [
	"Answer whether the receiver is above and to the left of aPoint."
	<return: #Boolean>

	^ x < aPoint x and: [ y < aPoint y ]
]

{ #category : 'converting' }
TbPoint2D >> asPoint [
	<return: #Point>

	^ self x @ self y
]

{ #category : 'converting' }
TbPoint2D >> asPoint2D [
	<return: #BlPoint2D>

	^ self
]

{ #category : 'initialization' }
TbPoint2D >> initialize [
	super initialize.
	
	x := 0.0.
	y := 0.0
]

{ #category : 'comparing' }
TbPoint2D >> max: aBlPoint [
	<return: #BlPoint>

	^ (x max: aBlPoint x) @ (y max: aBlPoint y)
]

{ #category : 'comparing' }
TbPoint2D >> min: aBlPoint [
	<return: #BlPoint>

	^ (x min: aBlPoint x) @ (y min: aBlPoint y)
]

{ #category : 'matrix - transforming points' }
TbPoint2D >> transformedOn: aBlMatrix [
	<return: #BlPoint>
	
	^ aBlMatrix transformPoint2D: self
]

{ #category : 'transformations' }
TbPoint2D >> translateBy: aDelta [ 
	"Answer a 2D Point translated by delta (an instance of Point)."
	<return: #BlPoint2D>

	^ self class x: (aDelta x + x) y: (aDelta y + y)
]

{ #category : 'accessing' }
TbPoint2D >> x [
	^ x
]

{ #category : 'accessing' }
TbPoint2D >> x: anObject [
	x := anObject
]

{ #category : 'initialization' }
TbPoint2D >> x: aX y: aY [
	x := aX.
	y := aY
]

{ #category : 'accessing' }
TbPoint2D >> y [
	^ y
]

{ #category : 'accessing' }
TbPoint2D >> y: anObject [
	y := anObject
]
