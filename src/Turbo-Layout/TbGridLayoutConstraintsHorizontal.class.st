Class {
	#name : #TbGridLayoutConstraintsHorizontal,
	#superclass : #TbGridLayoutConstraintsAxis,
	#category : #'Turbo-Layout-Grid'
}

{ #category : #alignment }
TbGridLayoutConstraintsHorizontal >> alignCenter [
	self specAlignment: TbGridAlignment center
]

{ #category : #alignment }
TbGridLayoutConstraintsHorizontal >> alignLeft [
	self specAlignment: TbGridAlignment left
]

{ #category : #alignment }
TbGridLayoutConstraintsHorizontal >> alignRight [
	self specAlignment: TbGridAlignment right
]
