Class {
	#name : #TbGridLayoutConstraintsHorizontal,
	#superclass : #TbGridLayoutConstraintsAxis,
	#category : #'Turbo-Layout-Grid'
}

{ #category : #alignment }
TbGridLayoutConstraintsHorizontal >> alignCenter [
	self specAlignment: BlGridAlignment center
]

{ #category : #alignment }
TbGridLayoutConstraintsHorizontal >> alignLeft [
	self specAlignment: BlGridAlignment left
]

{ #category : #alignment }
TbGridLayoutConstraintsHorizontal >> alignRight [
	self specAlignment: BlGridAlignment right
]
