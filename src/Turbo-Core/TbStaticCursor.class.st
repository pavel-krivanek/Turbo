Class {
	#name : #TbStaticCursor,
	#superclass : #TbCursor,
	#instVars : [
		'image'
	],
	#category : #'Turbo-Core-Space'
}

{ #category : #'as yet unclassified' }
TbStaticCursor >> activateOn: aSpace [
	aSpace updateCursorImage: self image
]

{ #category : #accessing }
TbStaticCursor >> image [
	^ image
]

{ #category : #accessing }
TbStaticCursor >> image: anObject [
	image := anObject
]
