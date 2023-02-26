Extension { #name : #Number }

{ #category : #'*Turbo-Core' }
Number >> , aNumber [
	<return: #BlVector>

	^ TbVector2D x: self y: aNumber
]

{ #category : #'*Turbo-Core' }
Number >> asBlocVector [
	^ TbVector x: self y: self
]

{ #category : #'*Turbo-Core' }
Number >> asScale3D [
	"Return a 3D vector representing a scale factor"
	<return: #BlVector3D>

	^ TbVector x: self y: self z: 1
]

{ #category : #'*Turbo-Core' }
Number >> asTranslate3D [
	"Return a 3D vector representing a translation vector"
	<return: #BlVector3D>

	^ TbVector x: self y: self z: 0
]

{ #category : #'*Turbo-Core' }
Number >> scalarMultiplicate2D: aVector2D [
	"Perform a scalar multiplication of a given 2D vector by me"
	<return: #BlVector>

	^ TbVector
		x: aVector2D x * self
		y: aVector2D y * self
]

{ #category : #'*Turbo-Core' }
Number >> scalarMultiplicate3D: aVector3D [
	"Perform a scalar multiplication of a given 3D vector by me"
	<return: #BlVector>

	^ TbVector
		x: aVector3D x * self
		y: aVector3D y * self
		z: aVector3D z * self
]

{ #category : #'*Turbo-Core' }
Number >> timesCollect: aBlock [
	^ (1 to: self) collect: [ :anIndex | aBlock cull: anIndex ]
]
