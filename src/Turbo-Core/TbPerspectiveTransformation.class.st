Class {
	#name : 'TbPerspectiveTransformation',
	#superclass : 'TbAffineTransformation',
	#instVars : [
		'depth'
	],
	#category : 'Turbo-Core-Basic-Transformations',
	#package : 'Turbo-Core',
	#tag : 'Basic-Transformations'
}

{ #category : 'instance creation' }
TbPerspectiveTransformation class >> depth: aNumber [
	<return: #BlPerspectiveTransformation>

	^ self new depth: aNumber
]

{ #category : 'accessing' }
TbPerspectiveTransformation >> depth [
	<return: #Number>

	^ depth
]

{ #category : 'accessing' }
TbPerspectiveTransformation >> depth: aNumber [
	self
		assert: [ aNumber > 0 ]
		description: [ 'Perspective must be positive' ].

	depth := aNumber
]

{ #category : 'testing' }
TbPerspectiveTransformation >> is2D [
	"Return true if transformation happens in x-y plane, hence 2D"
	<return: #Boolean>
	
	^ false
]

{ #category : 'mathematical functions' }
TbPerspectiveTransformation >> multiplyOn: aBlMatrix [
	aBlMatrix perspective: self depth
]
