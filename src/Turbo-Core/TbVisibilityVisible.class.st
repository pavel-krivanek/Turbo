"
I am a concrete visibility type - ""visible"".
Once set, element should be rendered and should participate in layout and take space.
"
Class {
	#name : #TbVisibilityVisible,
	#superclass : #TbVisibility,
	#category : #'Turbo-Core-Basic-Properties'
}

{ #category : #testing }
TbVisibilityVisible >> isVisible [
	^ true
]
