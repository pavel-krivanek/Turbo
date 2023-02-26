Class {
	#name : #TbDoubleClickEvent,
	#superclass : #TbMouseEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #testing }
TbDoubleClickEvent >> isDoubleClick [
	^ true
]

{ #category : #sending }
TbDoubleClickEvent >> sendTo: anObject [
	anObject dblClickEvent: self
]
