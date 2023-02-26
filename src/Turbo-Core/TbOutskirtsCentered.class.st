Class {
	#name : #TbOutskirtsCentered,
	#superclass : #TbOutskirts,
	#category : #'Turbo-Core-Basic-Border'
}

{ #category : #'visual bounds' }
TbOutskirtsCentered >> strokedBounds: aBlBounds of: anElement on: aCanvas [
	^ anElement geometry strokedBoundsCentered: aBlBounds of: anElement on: aCanvas
]

{ #category : #testing }
TbOutskirtsCentered >> wantsLayerOn: anElement [
	"Return true if background and border should be rendered on a separate layer,
	false otherwise"
	<return: #Boolean>
	
	^ anElement border isTransparent not
]
