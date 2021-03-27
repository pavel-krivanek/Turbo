Class {
	#name : #TextBlocClipper,
	#superclass : #TextBlocAbstractBuilder,
	#category : #'TextBloc-Core'
}

{ #category : #clipping }
TextBlocClipper >> by: aPath during: aBlock [

	self push: aPath.
	aBlock ensure: [ self pop ]
]

{ #category : #testing }
TextBlocClipper >> containsGlobal: aRectangle [
	<return: #Boolean>

	^ self globalBounds intersects: aRectangle
]

{ #category : #testing }
TextBlocClipper >> containsLocal: aRectangle [
	<return: #Boolean>

	^ self localBounds intersects: aRectangle
]

{ #category : #geometry }
TextBlocClipper >> globalBounds [
	| aTransformation aBounds |
	
	aTransformation := canvas transform current.
	aBounds := self localBounds.
	aTransformation transformRectangle: aBounds.
	^ aBounds
]

{ #category : #geometry }
TextBlocClipper >> localBounds [

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

{ #category : #clipping }
TextBlocClipper >> pop [

]

{ #category : #clipping }
TextBlocClipper >> push: aSpartaPath [
	"aSpartaPath spartaClipOn: canvas with: self"
]

{ #category : #clipping }
TextBlocClipper >> pushPath: aSpartaPath [

]

{ #category : #clipping }
TextBlocClipper >> pushRectangle: aRectangle [

]

{ #category : #clipping }
TextBlocClipper >> when: aWhenBlock by: aPathBlock during: aBlock [
	"Clip canvas by a given path only if when block evaluates to true"

	aWhenBlock value
		ifTrue: [ self by: aPathBlock value during: aBlock ]
		ifFalse: [ aBlock value ]
]
