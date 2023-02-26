Class {
	#name : #TbTouchMoveEvent,
	#superclass : #TbTouchEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbTouchMoveEvent >> sendTo: anObject [
	anObject touchMoveEvent: self
]
