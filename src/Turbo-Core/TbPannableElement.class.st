Class {
	#name : #TbPannableElement,
	#superclass : #TbScrollableElement,
	#instVars : [
		'zoomableElement'
	],
	#category : #'Turbo-Core-Utilities - Pannable'
}

{ #category : #conversion }
TbPannableElement >> asPannableElement [
	^ self
]

{ #category : #accessing }
TbPannableElement >> contentElement [
	^ self zoomableElement contentElement
]

{ #category : #accessing }
TbPannableElement >> contentElement: anElement [
	self zoomableElement contentElement: anElement.
	self zoomToFit
]

{ #category : #'api - testing' }
TbPannableElement >> hasContentElement [
	"Return true if I have a content element, false otherwise"
	<return: #Boolean>

	^ zoomableElement hasContentElement
]

{ #category : #initialization }
TbPannableElement >> initialize [
	super initialize.
	
	self alignCenter.
	
	zoomableElement := TbZoomableElement new.
	self addChild: zoomableElement
]

{ #category : #'api - zooming' }
TbPannableElement >> zoomIn [
	self zoomableElement zoomIn
]

{ #category : #'api - zooming' }
TbPannableElement >> zoomOut [
	self zoomableElement zoomOut
]

{ #category : #'api - zooming' }
TbPannableElement >> zoomTo: aZoomFactor [
	self zoomableElement zoomLevel: aZoomFactor
]

{ #category : #'api - zooming' }
TbPannableElement >> zoomToActualSize [
	self zoomTo: 1
]

{ #category : #'api - zooming' }
TbPannableElement >> zoomToFit [
	self zoomableElement zoomReset
]

{ #category : #accessing }
TbPannableElement >> zoomableElement [
	<return: #BlZoomableElement>
	
	^ zoomableElement
]
