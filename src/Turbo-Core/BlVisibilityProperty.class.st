Class {
	#name : #BlVisibilityProperty,
	#superclass : #BlObjectProperty,
	#category : #'Turbo-Core-Property'
}

{ #category : #'change management' }
BlVisibilityProperty >> invalidated [
	self owner
		requestLayout;
		invalidate
]
