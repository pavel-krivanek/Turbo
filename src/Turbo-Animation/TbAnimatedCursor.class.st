Class {
	#name : #TbAnimatedCursor,
	#superclass : #TbCursor,
	#instVars : [
		'images',
		'animation',
		'imgIndex'
	],
	#category : #'Turbo-Animation-Cursor'
}

{ #category : #'as yet unclassified' }
TbAnimatedCursor >> activateOn: aSpace [
	self images ifNil: [ ^ self ].
	self createAnimation
		onStepDo: [ self updateNextImageOn: aSpace ];
		start
]

{ #category : #'as yet unclassified' }
TbAnimatedCursor >> createAnimation [
	animation ifNotNil:[animation stop].
	imgIndex := 0.
	^ animation := TbAnimation new
		duration: 50;
		beInfinite;
		yourself
]

{ #category : #'as yet unclassified' }
TbAnimatedCursor >> deactivateOn: aSpace [
	animation ifNotNil: [ animation stop ]
]

{ #category : #accessing }
TbAnimatedCursor >> images [
	^ images
]

{ #category : #accessing }
TbAnimatedCursor >> images: anObject [
	images := anObject
]

{ #category : #'as yet unclassified' }
TbAnimatedCursor >> updateNextImageOn: aSpace [
	
	imgIndex := (imgIndex % images size) + 1.
	aSpace updateCursorImage: (images at: imgIndex).
]
