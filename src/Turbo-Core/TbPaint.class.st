"
I am a root class of all Paints in Bloc.
Paints are used for background, border, text fill or stroke.

All paints are meant to be immutable
"
Class {
	#name : #TbPaint,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : #'Turbo-Core-Paint'
}

{ #category : #'instance creation' }
TbPaint class >> transparent [
	"Return a completely transparent paint"
	<return: #BlPaint>
	
	^ TbColorPaint transparent
]

{ #category : #converting }
TbPaint >> asBlBackground [
	^ TbBackground paint: self
]

{ #category : #converting }
TbPaint >> asBlPaint [
	^ self
]

{ #category : #testing }
TbPaint >> isTransparent [
	"Return true if I am transparent, false otherwise.
	It is important to implement paint specific logic in subclasses.
	If paint is transparent there is no need to render anything that uses it"
	<return: #Boolean>

	^ false
]

{ #category : #geometry }
TbPaint >> matchExtent: anExtent [
	self subclassResponsibility
]
