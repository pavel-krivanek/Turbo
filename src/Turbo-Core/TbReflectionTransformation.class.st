"
Irepresent a reflection affine transformation.

In mathematics, a reflection (also spelled reflexion)[1] is a mapping from a Euclidean space to itself that is an isometry with a hyperplane as a set of fixed points; this set is called the axis (in dimension 2) or plane (in dimension 3) of reflection. The image of a figure by a reflection is its mirror image in the axis or plane of reflection. For example the mirror image of the small Latin letter p for a reflection with respect to a vertical axis would look like q. Its image by reflection in a horizontal axis would look like b. A reflection is an involution: when applied twice in succession, every point returns to its original location, and every geometrical object is restored to its original state.

I am similar to ""flip"" css filter.

Example:

	BlReflectionTransformation horizontal - creates a reflection in Y axis
	BlReflectionTransformation vertical - creates a reflection in X axis
"
Class {
	#name : 'TbReflectionTransformation',
	#superclass : 'TbAffineTransformation',
	#instVars : [
		'reflection'
	],
	#category : 'Turbo-Core-Basic-Transformations',
	#package : 'Turbo-Core',
	#tag : 'Basic-Transformations'
}

{ #category : 'factory' }
TbReflectionTransformation class >> horizontal [
	^ self new reflection: (TbVector x: -1 y: 1)
]

{ #category : 'factory' }
TbReflectionTransformation class >> vertical [
	^ self new reflection: (TbVector x: 1 y: -1)
]

{ #category : 'testing' }
TbReflectionTransformation >> is2D [
	<return: #Boolean>

	^ true
]

{ #category : 'mathematical functions' }
TbReflectionTransformation >> multiplyOn: aBlMatrix [

	aBlMatrix reflectBy: self reflection
]

{ #category : 'accessing' }
TbReflectionTransformation >> reflection [
	<return: #TbVector>

	^ reflection
]

{ #category : 'accessing' }
TbReflectionTransformation >> reflection: aVector [
	reflection := aVector asBlocVector
]
