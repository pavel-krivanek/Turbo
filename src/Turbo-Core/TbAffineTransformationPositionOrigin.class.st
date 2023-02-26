"
I allow users to provide a fixed location that should be used as transformation origin
"
Class {
	#name : #TbAffineTransformationPositionOrigin,
	#superclass : #TbAffineTransformationOrigin,
	#instVars : [
		'position'
	],
	#category : #'Turbo-Core-Basic-Transformations'
}

{ #category : #'instance creation' }
TbAffineTransformationPositionOrigin class >> position: aPoint [
	^ self new position: aPoint
]

{ #category : #math }
TbAffineTransformationPositionOrigin >> originIn: anElement [
	"@see Method comment BlAffineTransformationOrigin>>#originIn:"
	<return: #Point or: #BlPoint3D>

	^ self position
]

{ #category : #accessing }
TbAffineTransformationPositionOrigin >> position [
	<return: #Point or: #BlPoint3D>

	^ position
]

{ #category : #accessing }
TbAffineTransformationPositionOrigin >> position: aPoint [
	position := aPoint
]
