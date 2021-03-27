"
I am sent by an overshooting scroller when it is run
"
Class {
	#name : #BlOvershootingScrollerRunEvent,
	#superclass : #BlEvent,
	#instVars : [
		'isFinished'
	],
	#category : #'Turbo-Core-Utilities - Scrolling Helpers'
}

{ #category : #accessing }
BlOvershootingScrollerRunEvent >> isFinished [
	^ isFinished
]

{ #category : #accessing }
BlOvershootingScrollerRunEvent >> isFinished: anObject [
	isFinished := anObject
]
