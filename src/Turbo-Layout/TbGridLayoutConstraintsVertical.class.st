Class {
	#name : #TbGridLayoutConstraintsVertical,
	#superclass : #TbGridLayoutConstraintsAxis,
	#category : #'Turbo-Layout-Grid'
}

{ #category : #alignment }
TbGridLayoutConstraintsVertical >> alignBottom [
	self specAlignment: TbGridAlignment bottom
]

{ #category : #alignment }
TbGridLayoutConstraintsVertical >> alignCenter [
	self specAlignment: TbGridAlignment center
]

{ #category : #alignment }
TbGridLayoutConstraintsVertical >> alignTop [
	self specAlignment: TbGridAlignment top
]
