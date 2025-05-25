Class {
	#name : 'TbGridTrailingAlignment',
	#superclass : 'TbGridAlignment',
	#category : 'Turbo-Layout-Grid-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Grid-Utilities'
}

{ #category : 'alignment' }
TbGridTrailingAlignment >> alignmentValue: anElement viewSize: viewSize [
	^ viewSize
]

{ #category : 'alignment' }
TbGridTrailingAlignment >> gravityOffset: anElement cellDelta: cellDelta [
	^ cellDelta
]
