Class {
	#name : 'TbAffineCompositeTransformation',
	#superclass : 'TbAffineTransformation',
	#instVars : [
		'transformations'
	],
	#category : 'Turbo-Core-Basic-Transformations',
	#package : 'Turbo-Core',
	#tag : 'Basic-Transformations'
}

{ #category : 'adding' }
TbAffineCompositeTransformation >> addTransformation: aBlAffineTransformation [
	"There can be only one transformation instance per type"

	self transformations add: aBlAffineTransformation
]

{ #category : 'enumerating' }
TbAffineCompositeTransformation >> do: aBlock [
	transformations do: [ :aTransfromation | aTransfromation do: aBlock ]
]

{ #category : 'testing' }
TbAffineCompositeTransformation >> hasTransformations [
	<return: #Boolean>

	^ self transformations isNotEmpty
]

{ #category : 'initialization' }
TbAffineCompositeTransformation >> initialize [
	super initialize.
	
	transformations := OrderedCollection new
]

{ #category : 'testing' }
TbAffineCompositeTransformation >> is2D [
	^ self transformations allSatisfy: #is2D
]

{ #category : 'testing' }
TbAffineCompositeTransformation >> isIdentity [
	^ self hasTransformations not
]

{ #category : 'testing' }
TbAffineCompositeTransformation >> multiplyOn: aBlMatrix [
	self transformations do: [ :aTransformation | aTransformation multiplyOn: aBlMatrix ]
]

{ #category : 'testing' }
TbAffineCompositeTransformation >> multiplyOn: aBlMatrix in: aBlElement [
	self transformations do: [ :aTransformation | aTransformation multiplyOn: aBlMatrix in: aBlElement ]
]

{ #category : 'printing' }
TbAffineCompositeTransformation >> printOn: aStream [
	aStream nextPutAll: 'Composition'
]

{ #category : 'accessing' }
TbAffineCompositeTransformation >> transformations [
	<return: #Collection of: #BlAffineTransformation>
	
	^ transformations
]
