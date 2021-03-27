Class {
	#name : #TbSpaceFocusInEvent,
	#superclass : #TbSpaceEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #sending }
TbSpaceFocusInEvent >> sendTo: anObject [
	anObject spaceFocusInEvent: self
]
