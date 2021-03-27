"
I represent a visibility type and can be
	""gone"" - element is not visible and does not take any space in layout
	""hidden"" - element is not visible but participates in layout
	""visible"" - normal visiblity

Visibility is independent from opacity, which is just a visual property.
Invisible (gone or hidden) elements don't receive event, while transparent (opacity = 0) do receive.

If you want to make element transparent and preserve ability to handle events set opacity to zero:
==element opacity: 0==
"
Class {
	#name : #TbVisibility,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#classInstVars : [
		'gone',
		'hidden',
		'visible'
	],
	#category : #'Turbo-Core-Basic-Properties'
}

{ #category : #cleanup }
TbVisibility class >> cleanUp [
	super cleanUp.
	
	gone := nil.
	hidden := nil.
	visible := nil
]

{ #category : #visibilities }
TbVisibility class >> gone [
	^ gone ifNil: [ gone := BlVisibilityGone new ]
]

{ #category : #visibilities }
TbVisibility class >> hidden [
	^ hidden ifNil: [ hidden := BlVisibilityHidden new ]
]

{ #category : #visibilities }
TbVisibility class >> visible [
	^ visible ifNil: [ BlVisibilityVisible new ]
]

{ #category : #comparing }
TbVisibility >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : #comparing }
TbVisibility >> hash [
	^ self class hash
]

{ #category : #testing }
TbVisibility >> isGone [
	^ false
]

{ #category : #testing }
TbVisibility >> isHidden [
	^ false
]

{ #category : #testing }
TbVisibility >> isVisible [
	^ false
]

{ #category : #testing }
TbVisibility >> shouldDraw [
	^ self isVisible
]

{ #category : #testing }
TbVisibility >> shouldLayout [
	^ self isVisible and: [ self isGone not ]
]

{ #category : #testing }
TbVisibility >> shouldMeasure [
	^ self isVisible
]
