"
I am sent by an overshooting scroller when it is run
"
Class {
	#name : 'TbOvershootingScrollerRunEvent',
	#superclass : 'TbEvent',
	#instVars : [
		'isFinished'
	],
	#category : 'Turbo-Core-Utilities - Scrolling Helpers',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Scrolling Helpers'
}

{ #category : 'accessing' }
TbOvershootingScrollerRunEvent >> isFinished [
	^ isFinished
]

{ #category : 'accessing' }
TbOvershootingScrollerRunEvent >> isFinished: anObject [
	isFinished := anObject
]
