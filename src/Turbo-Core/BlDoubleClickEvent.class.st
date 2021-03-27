Class {
	#name : #BlDoubleClickEvent,
	#superclass : #BlMouseEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #testing }
BlDoubleClickEvent >> isDoubleClick [
	^ true
]

{ #category : #sending }
BlDoubleClickEvent >> sendTo: anObject [
	anObject dblClickEvent: self
]
