Class {
	#name : #TbPoint4D,
	#superclass : #TbPoint,
	#instVars : [
		'x',
		'y',
		'z',
		'w'
	],
	#category : #'Turbo-Core-Basic-Math'
}

{ #category : #'instance creation' }
TbPoint4D class >> x: aX y: aY z: aZ w: aW [

	^ self new
		x: aX y: aY z: aZ w: aW;
		yourself
]

{ #category : #converting }
TbPoint4D >> asPoint2D [
	<return: #BlPoint2D>

	^ TbPoint2D x: (self x asFloat / self w) y: (self y asFloat / self w)
]

{ #category : #initialization }
TbPoint4D >> initialize [
	super initialize.
	
	x := 0.0.
	y := 0.0.
	z := 0.0.
	w := 0.0
]

{ #category : #'matrix - transforming points' }
TbPoint4D >> transformedOn: aBlMatrix [
	<return: #BlPoint>
	
	^ aBlMatrix transformPoint4D: self
]

{ #category : #accessing }
TbPoint4D >> w [
	^ w
]

{ #category : #accessing }
TbPoint4D >> x [
	^ x
]

{ #category : #initialization }
TbPoint4D >> x: aX y: aY z: aZ w: aW [

	x := aX.
	y := aY.
	z := aZ.
	w := aW
]

{ #category : #accessing }
TbPoint4D >> y [
	^ y
]

{ #category : #accessing }
TbPoint4D >> z [
	^ z
]
