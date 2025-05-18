Class {
	#name : 'TbOutskirtsInside',
	#superclass : 'TbOutskirts',
	#category : 'Turbo-Core-Basic-Border',
	#package : 'Turbo-Core',
	#tag : 'Basic-Border'
}

{ #category : 'visual bounds' }
TbOutskirtsInside >> strokedBounds: aBlBounds of: anElement on: aCanvas [
	^ anElement geometry strokedBoundsInside: aBlBounds of: anElement on: aCanvas
]

{ #category : 'testing' }
TbOutskirtsInside >> wantsLayerOn: anElement [
	"Return true if background and border should be rendered on a separate layer,
	false otherwise"
	<return: #Boolean>
	
	^ anElement border isVisible
]
