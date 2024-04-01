"
I am a concrete horizontal orientation
"
Class {
	#name : #TbLayoutHorizontal,
	#superclass : #TbLayoutOrientation,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #testing }
TbLayoutHorizontal >> isHorizontal [
	^ true
]

{ #category : #testing }
TbLayoutHorizontal >> isVertical [
	^ false
]

{ #category : #dispatch }
TbLayoutHorizontal >> of: anObject [
	^ anObject horizontal
]
