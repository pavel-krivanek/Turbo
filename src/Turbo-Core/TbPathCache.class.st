"
I am responsible for caching backend specific geometry path of the element.
Geometry path is created with the help of backend-specific path builder by BlGeometry
"
Class {
	#name : #TbPathCache,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'session',
		'canvasIdentity',
		'geometry',
		'geometryPath'
	],
	#category : #'Turbo-Core-Basic-Support'
}

{ #category : #'instance creation' }
TbPathCache class >> on: aGeometry [
	^ self new geometry: aGeometry
]

{ #category : #'session management' }
TbPathCache >> checkIdentity: aCanvas [
	canvasIdentity = aCanvas identity
		ifFalse: [ self releaseCache ]
]

{ #category : #'session management' }
TbPathCache >> checkSession [
	session == Smalltalk session
		ifFalse: [
			session := Smalltalk session.
			self releaseCache ]
]

{ #category : #accessing }
TbPathCache >> geometry [
	"Return a geometry whose path I cache"
	<return: #BlGeometry>

	^ geometry
]

{ #category : #accessing }
TbPathCache >> geometry: aBlGeometry [
	"Attach a geometry which path I should cache"

	self
		assert: [ aBlGeometry isNotNil ]
		description: [ 'Geometry must not be nil' ].

	geometry := aBlGeometry
]

{ #category : #accessing }
TbPathCache >> releaseCache [
	"Release path caches requiring their fresh creation"

	geometryPath := nil
]
