Class {
	#name : #TbSpaceFocusOutEvent,
	#superclass : #TbSpaceEvent,
	#category : #'Turbo-Core-Events'
}

{ #category : #'as yet unclassified' }
TbSpaceFocusOutEvent >> sendTo: anObject [
	anObject spaceFocusOutEvent: self
]
