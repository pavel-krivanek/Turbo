"
Specifies a scale operation by the (x,y,z) scaling vector.

For example, scale(1, 1) would leave an element unchanged, while scale(2, 2) would cause it to appear twice as long in both the X and Y axes, or four times its typical geometric size.

Corresponds to SVG scale() function
https://drafts.csswg.org/css-transforms/#valdef-transform-scale
"
Class {
	#name : #TbScalingTransformation,
	#superclass : #TbAffineTransformation,
	#instVars : [
		'scale'
	],
	#category : #'Turbo-Core-Basic-Transformations'
}

{ #category : #'instance creation' }
TbScalingTransformation class >> scale: aVector [
	^ self new scale: aVector
]

{ #category : #initialization }
TbScalingTransformation >> initialize [
	super initialize.
	
	scale := TbVector one
]

{ #category : #testing }
TbScalingTransformation >> is2D [
	<return: #Boolean>

	^ self scale z closeTo: 1
]

{ #category : #'mathematical functions' }
TbScalingTransformation >> multiplyOn: aBlMatrix [
	aBlMatrix scaleBy: self scale
]

{ #category : #printing }
TbScalingTransformation >> printOn: aStream [
	aStream
		nextPutAll: 'Scaling by '.
		
	self scale printOn: aStream
]

{ #category : #accessing }
TbScalingTransformation >> scale [
	<return: #BlVector>

	^ scale
]

{ #category : #accessing }
TbScalingTransformation >> scale: aVector [
	scale := aVector asScale3D
]
