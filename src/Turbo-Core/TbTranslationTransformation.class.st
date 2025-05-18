"
Specifies a translation by the vector (x, y, z).

Corresponds to SVG translate() function
https://drafts.csswg.org/css-transforms/#valdef-transform-translate
"
Class {
	#name : 'TbTranslationTransformation',
	#superclass : 'TbAffineTransformation',
	#instVars : [
		'translation'
	],
	#category : 'Turbo-Core-Basic-Transformations',
	#package : 'Turbo-Core',
	#tag : 'Basic-Transformations'
}

{ #category : 'instance creation' }
TbTranslationTransformation class >> translation: aVector [
	^ self new translation: aVector
]

{ #category : 'instance creation' }
TbTranslationTransformation class >> x: aX y: aY z: aZ [
	^ self new
		translation: (TbVector x: aX y: aY z: aZ)
]

{ #category : 'initialization' }
TbTranslationTransformation >> initialize [
	super initialize.
	
	translation := TbVector zero
]

{ #category : 'testing' }
TbTranslationTransformation >> is2D [
	<return: #Boolean>

	^ self translation z isZero
]

{ #category : 'mathematical functions' }
TbTranslationTransformation >> multiplyOn: aBlMatrix [

	aBlMatrix translateBy: self translation
]

{ #category : 'printing' }
TbTranslationTransformation >> printOn: aStream [
	aStream
		nextPutAll: 'Translation by '.
		
	self translation printOn: aStream
]

{ #category : 'accessing' }
TbTranslationTransformation >> translation [
	<return: #TbVector>

	^ translation
]

{ #category : 'accessing' }
TbTranslationTransformation >> translation: aVector [
	translation := aVector asTranslate3D
]
