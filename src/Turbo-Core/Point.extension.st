Extension { #name : #Point }

{ #category : #'*Turbo-Core' }
Point >> @ aNumber [
	"Create a new 3D point with x and y represented by me and given number as z"
	<return: #BlPoint3D>

	^ BlPoint3D x: x y: y z: aNumber
]

{ #category : #'*Turbo-Core' }
Point >> asBlocVector [
	^ BlVector x: x y: y
]

{ #category : #'*Turbo-Core' }
Point >> asScale3D [
	"Return a 3D vector representing a scale factor"
	<return: #BlVector3D>

	^ BlVector x: self x y: self y z: 1
]

{ #category : #'*Turbo-Core' }
Point >> asTranslate3D [
	"Return a 3D vector representing a translation vector"
	<return: #BlVector3D>

	^ BlVector x: self x y: self y z: 0
]

{ #category : #'*Turbo-Core' }
Point >> isPoint2D [
	"Return true if I represent a 2D point, false otherwise"
	<return: #Boolean>

	^ true
]

{ #category : #'*Turbo-Core' }
Point >> isPoint3D [
	"Return true if I represent a 3D point, false otherwise"
	<return: #Boolean>

	^ false
]

{ #category : #'*Turbo-Core' }
Point >> scalarMultiplicate2D: aVector2D [
	"Perform a scalar multiplication of a given 2D vector by me"
	<return: #BlVector>

	^ BlVector
		x: aVector2D x * self x
		y: aVector2D y * self y
]

{ #category : #'*Turbo-Core' }
Point >> transformedOn: aBlMatrix [
	<return: #BlPoint>
	
	^ aBlMatrix transformPoint2D: self
]
