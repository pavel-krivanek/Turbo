"
I am a very basic layout that supports very simple measurement and positions elements according to their #position attribute, which means that I never change actual location (position) of children within parent with basic layout.
"
Class {
	#name : #TbBasicLayout,
	#superclass : #TbLayout,
	#category : #'Turbo-Core-Layouts-Basic'
}

{ #category : #layout }
TbBasicLayout >> layout: anElement in: aRectangle [

	anElement children accountedByLayout do: [ :child |
		child applyLayoutIn: child measuredBounds asRectangle ].

	self layoutIgnored: anElement
]

{ #category : #measure }
TbBasicLayout >> measure: anElement with: anExtentSpec [
	super measure: anElement with: anExtentSpec.
	
	self measureIgnored: anElement with: anExtentSpec
]
