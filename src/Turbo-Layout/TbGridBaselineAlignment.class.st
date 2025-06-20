Class {
	#name : 'TbGridBaselineAlignment',
	#superclass : 'TbGridAlignment',
	#category : 'Turbo-Layout-Grid-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Grid-Utilities'
}

{ #category : 'alignment' }
TbGridBaselineAlignment >> alignmentValue: anElement viewSize: viewSize [
	^ UNDEFINED
]

{ #category : 'accessing' }
TbGridBaselineAlignment >> bounds [
	^ TbGridLayoutBaselineBounds new
]

{ #category : 'alignment' }
TbGridBaselineAlignment >> gravityOffset: anElement cellDelta: cellDelta [
	^ 0
]
