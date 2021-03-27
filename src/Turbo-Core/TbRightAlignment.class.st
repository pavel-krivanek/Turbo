"
I represent right alignment.
See BlLayoutAlignment for more info.
"
Class {
	#name : #TbRightAlignment,
	#superclass : #TbHorizontalAlignment,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #'class initialization' }
TbRightAlignment class >> initialize [
	super initialize.
]

{ #category : #factory }
TbRightAlignment class >> leftToRight [
	^ self right
]

{ #category : #factory }
TbRightAlignment class >> rightToLeft [
	^ self left
]

{ #category : #factory }
TbRightAlignment >> inverted [
	^ BlElementAlignment vertical end
]

{ #category : #factory }
TbRightAlignment >> swap [
	^ BlElementAlignment left
]

{ #category : #translation }
TbRightAlignment >> translationOf: aBounds in: aContainerBounds [
	<return: #Point>
	
	^ (aContainerBounds width - aBounds width + aContainerBounds left - aBounds left) @ 0
]
