"
I am a concrete visibility type - ""gone"".
Once set, element should not be rendered and should not participate in layout (should not take space)
"
Class {
	#name : #TbVisibilityGone,
	#superclass : #TbVisibility,
	#category : #'Turbo-Core-Basic-Properties'
}

{ #category : #testing }
TbVisibilityGone >> isGone [
	^ true
]

{ #category : #testing }
TbVisibilityGone >> isHidden [
	^ true
]
