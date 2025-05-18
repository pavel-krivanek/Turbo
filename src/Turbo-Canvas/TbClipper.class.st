Class {
	#name : 'TbClipper',
	#superclass : 'TbAbstractBuilder',
	#category : 'Turbo-Canvas',
	#package : 'Turbo-Canvas'
}

{ #category : 'clipping' }
TbClipper >> by: aPath during: aBlock [

	self push: aPath.
	aBlock ensure: [ self pop ]
]

{ #category : 'testing' }
TbClipper >> containsGlobal: aRectangle [
	<return: #Boolean>

	^ self globalBounds intersects: aRectangle
]

{ #category : 'testing' }
TbClipper >> containsLocal: aRectangle [
	<return: #Boolean>

	^ self localBounds intersects: aRectangle
]

{ #category : 'geometry' }
TbClipper >> globalBounds [
	| aTransformation aBounds |
	
	aTransformation := canvas transform current.
	aBounds := self localBounds.
	aTransformation transformRectangle: aBounds.
	^ aBounds
]

{ #category : 'geometry' }
TbClipper >> localBounds [

	^ Rectangle new.
	"	| anOriginX anOriginY aCornerX aCornerY aDoubleSize aRectangle |

	aDoubleSize := (FFIExternalType resolveType: 'double') externalTypeSize.
	anOriginX := ExternalAddress allocate: aDoubleSize.
	anOriginY := ExternalAddress allocate: aDoubleSize.
	aCornerX := ExternalAddress allocate: aDoubleSize.
	aCornerY := ExternalAddress allocate: aDoubleSize.
	
	self primGetClipOriginX: anOriginX originY: anOriginY cornerX: aCornerX cornerY: aCornerY.

	aRectangle := SpartaRectangle new
		left: (anOriginX doubleAt: 1)
		top: (anOriginY doubleAt: 1)
		right: (aCornerX doubleAt: 1)
		bottom: (aCornerY doubleAt: 1).
		
	anOriginX free.
	anOriginY free.
	aCornerX free.
	aCornerY free."
	

]

{ #category : 'clipping' }
TbClipper >> pop [

]

{ #category : 'clipping' }
TbClipper >> push: aSpartaPath [
	"aSpartaPath spartaClipOn: canvas with: self"
]

{ #category : 'clipping' }
TbClipper >> pushPath: aSpartaPath [

]

{ #category : 'clipping' }
TbClipper >> pushRectangle: aRectangle [

]

{ #category : 'clipping' }
TbClipper >> when: aWhenBlock by: aPathBlock during: aBlock [
	"Clip canvas by a given path only if when block evaluates to true"

	aWhenBlock value
		ifTrue: [ self by: aPathBlock value during: aBlock ]
		ifFalse: [ aBlock value ]
]
