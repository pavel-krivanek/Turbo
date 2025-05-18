"
I am a concrete vertical orientation
"
Class {
	#name : 'TbLayoutVertical',
	#superclass : 'TbLayoutOrientation',
	#category : 'Turbo-Core-Layouts-Support',
	#package : 'Turbo-Core',
	#tag : 'Layouts-Support'
}

{ #category : 'testing' }
TbLayoutVertical >> isHorizontal [
	^ false
]

{ #category : 'testing' }
TbLayoutVertical >> isVertical [
	^ true
]

{ #category : 'dispatch' }
TbLayoutVertical >> of: anObject [
	^ anObject vertical
]
