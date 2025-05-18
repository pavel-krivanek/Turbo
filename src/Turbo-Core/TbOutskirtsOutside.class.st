Class {
	#name : 'TbOutskirtsOutside',
	#superclass : 'TbOutskirts',
	#category : 'Turbo-Core-Basic-Border',
	#package : 'Turbo-Core',
	#tag : 'Basic-Border'
}

{ #category : 'visual bounds' }
TbOutskirtsOutside >> strokedBounds: aBlBounds of: anElement on: aCanvas [
	^ anElement geometry strokedBoundsOutside: aBlBounds of: anElement on: aCanvas
]

{ #category : 'testing' }
TbOutskirtsOutside >> wantsLayerOn: anElement [
	"Return true if background and border should be rendered on a separate layer,
	false otherwise"
	<return: #Boolean>
	
	^ anElement border isVisible
]
