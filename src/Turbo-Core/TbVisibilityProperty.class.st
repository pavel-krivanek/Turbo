Class {
	#name : 'TbVisibilityProperty',
	#superclass : 'TbObjectProperty',
	#category : 'Turbo-Core-Property',
	#package : 'Turbo-Core',
	#tag : 'Property'
}

{ #category : 'change management' }
TbVisibilityProperty >> invalidated [
	self owner
		requestLayout;
		invalidate
]
