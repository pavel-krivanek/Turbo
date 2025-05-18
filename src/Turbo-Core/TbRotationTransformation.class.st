"
Specifies a rotation by the angle specified in the parameter about the origin of the element, as defined by the transformation #origin property. For example, rotate(90deg) would cause elements to appear rotated one-quarter of a turn in the clockwise direction.

Corresponds to SVG rotate() function
https://drafts.csswg.org/css-transforms/#valdef-transform-rotate
"
Class {
	#name : 'TbRotationTransformation',
	#superclass : 'TbAffineTransformation',
	#instVars : [
		'angle',
		'axis'
	],
	#category : 'Turbo-Core-Basic-Transformations',
	#package : 'Turbo-Core',
	#tag : 'Basic-Transformations'
}

{ #category : 'accessing' }
TbRotationTransformation >> angle [
	^ angle
]

{ #category : 'accessing' }
TbRotationTransformation >> angle: aNumber [
	"Set a rotation angle in degrees"

	angle := aNumber
]

{ #category : 'converting' }
TbRotationTransformation >> asQuaternion [
	<return: #BlQuaternion>

	^ TbQuaternion x: self axis x y: self axis y z: self axis z angle: self angle
]

{ #category : 'accessing' }
TbRotationTransformation >> axis [
	<return: #TbVector>
	
	^ axis
]

{ #category : 'accessing' }
TbRotationTransformation >> axis: aVector [
	axis := aVector
]

{ #category : 'initialization' }
TbRotationTransformation >> initialize [
	super initialize.
	
	angle := 0. "degrees"
	axis := TbVector zAxis
]

{ #category : 'testing' }
TbRotationTransformation >> is2D [
	"Return true if I represent a rotation in 2D space, false otherwise.
	By definition a rotation is in 2D when rotation axis is z-Axis (it has no x or y components)"
	<return: #Boolean>

	^ self axis = TbVector zAxis
]

{ #category : 'mathematical functions' }
TbRotationTransformation >> multiplyOn: aBlMatrix [

	aBlMatrix
		rotateByDegrees: self angle
		around: self axis
]

{ #category : 'printing' }
TbRotationTransformation >> printOn: aStream [
	aStream
		nextPutAll: 'Rotation by ';
		nextPutAll: self angle asString;
		nextPutAll: ' degress around axis ';
		nextPutAll: self axis asString
]
