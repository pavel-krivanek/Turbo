Class {
	#name : 'TbGridFillAlignment',
	#superclass : 'TbGridAlignment',
	#category : 'Turbo-Layout-Grid-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Grid-Utilities'
}

{ #category : 'alignment' }
TbGridFillAlignment >> alignmentValue: anElement viewSize: viewSize [
	^ UNDEFINED
]

{ #category : 'alignment' }
TbGridFillAlignment >> gravityOffset: anElement cellDelta: cellDelta [
	^ 0
]

{ #category : 'testing' }
TbGridFillAlignment >> isFill [
	^ true
]

{ #category : 'alignment' }
TbGridFillAlignment >> sizeInCell: anElement viewSize: viewSize cellSize: cellSize [
	^ cellSize
]
