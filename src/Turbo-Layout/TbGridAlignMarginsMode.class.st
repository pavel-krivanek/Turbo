Class {
	#name : 'TbGridAlignMarginsMode',
	#superclass : 'TbGridAlignmentMode',
	#category : 'Turbo-Layout-Grid-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Grid-Utilities'
}

{ #category : 'testing' }
TbGridAlignMarginsMode >> isAlignMargins [
	^ true
]

{ #category : 'computing margins' }
TbGridAlignMarginsMode >> marginOf: aChildElement in: aGridLayout isHorizontal: isHorizontal isLeading: isLeading [

	^ aGridLayout measurer marginOf: aChildElement isHorizontal: isHorizontal isLeading: isLeading
]
