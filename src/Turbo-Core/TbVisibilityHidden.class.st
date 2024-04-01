"
I am a concrete visibility type - ""hidden"".
Once set, element should not be rendered but should participate in layout and take space.
"
Class {
	#name : #TbVisibilityHidden,
	#superclass : #TbVisibility,
	#category : #'Turbo-Core-Basic-Properties'
}

{ #category : #testing }
TbVisibilityHidden >> isHidden [
	^ true
]
