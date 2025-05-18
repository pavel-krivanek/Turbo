Class {
	#name : 'TbNullVerticalAlignment',
	#superclass : 'TbNullAlignment',
	#category : 'Turbo-Core-Layouts-Support',
	#package : 'Turbo-Core',
	#tag : 'Layouts-Support'
}

{ #category : 'composition' }
TbNullVerticalAlignment >> + aHorizontalAlignment [
	^ TbCompositeAlignment horizontal: aHorizontalAlignment vertical: self
]

{ #category : 'translation' }
TbNullVerticalAlignment >> translationOf: aBounds in: aContainerBounds [
	^ 0 @ 0
]
