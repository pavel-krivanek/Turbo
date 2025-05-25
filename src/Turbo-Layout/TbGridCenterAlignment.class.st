Class {
	#name : 'TbGridCenterAlignment',
	#superclass : 'TbGridAlignment',
	#category : 'Turbo-Layout-Grid-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Grid-Utilities'
}

{ #category : 'alignment' }
TbGridCenterAlignment >> alignmentValue: anElement viewSize: viewSize [
	^ viewSize / 2.0
]

{ #category : 'alignment' }
TbGridCenterAlignment >> gravityOffset: anElement cellDelta: cellDelta [
	self flag: 'or multiply?'.
	^ cellDelta / 2.0
]
