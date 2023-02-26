Class {
	#name : #TbTouchDownEvent,
	#superclass : #TbTouchEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbTouchDownEvent >> sendTo: anObject [
	anObject touchDownEvent: self
]
