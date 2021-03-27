Class {
	#name : #TbGridLayoutConstraintsVertical,
	#superclass : #TbGridLayoutConstraintsAxis,
	#category : #'Turbo-Layout-Grid'
}

{ #category : #alignment }
TbGridLayoutConstraintsVertical >> alignBottom [
	self specAlignment: BlGridAlignment bottom
]

{ #category : #alignment }
TbGridLayoutConstraintsVertical >> alignCenter [
	self specAlignment: BlGridAlignment center
]

{ #category : #alignment }
TbGridLayoutConstraintsVertical >> alignTop [
	self specAlignment: BlGridAlignment top
]
