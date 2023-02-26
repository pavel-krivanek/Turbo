Class {
	#name : #TbTouchUpEvent,
	#superclass : #TbTouchEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbTouchUpEvent >> sendTo: anObject [
	anObject touchUpEvent: self
]
