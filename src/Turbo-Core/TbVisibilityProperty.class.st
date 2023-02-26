Class {
	#name : #TbVisibilityProperty,
	#superclass : #TbObjectProperty,
	#category : #'Turbo-Core-Property'
}

{ #category : #'change management' }
TbVisibilityProperty >> invalidated [
	self owner
		requestLayout;
		invalidate
]
