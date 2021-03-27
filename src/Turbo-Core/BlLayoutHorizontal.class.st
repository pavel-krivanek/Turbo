"
I am a concrete horizontal orientation
"
Class {
	#name : #BlLayoutHorizontal,
	#superclass : #BlLayoutOrientation,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #testing }
BlLayoutHorizontal >> isHorizontal [
	^ true
]

{ #category : #testing }
BlLayoutHorizontal >> isVertical [
	^ false
]

{ #category : #dispatch }
BlLayoutHorizontal >> of: anObject [
	^ anObject horizontal
]
