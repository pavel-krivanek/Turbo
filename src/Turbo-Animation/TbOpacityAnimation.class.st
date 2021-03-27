"
I am an animation responsible for changing #opacity parameter of the target element during specified period of time.
"
Class {
	#name : #TbOpacityAnimation,
	#superclass : #TbAnimation,
	#instVars : [
		'to',
		'from'
	],
	#category : #'Turbo-Animation-Animation'
}

{ #category : #pulse }
TbOpacityAnimation >> applyValue: aValue [
	self target opacity: aValue
]

{ #category : #pulse }
TbOpacityAnimation >> initStart [
	super initStart.
	from := self target opacity.
]

{ #category : #accessing }
TbOpacityAnimation >> opacity: aNumber [
	"Set desired opacity of an element at the end of animation"
	to := aNumber
]

{ #category : #pulse }
TbOpacityAnimation >> valueForStep: aDelta [
	^ ((to - from ) * aDelta) + from
]
