Class {
	#name : #TbHorizontalEndAlignment,
	#superclass : #TbHorizontalAlignment,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #'class initialization' }
TbHorizontalEndAlignment class >> initialize [
	super initialize.
]

{ #category : #factory }
TbHorizontalEndAlignment class >> leftToRight [
	^ self right
]

{ #category : #factory }
TbHorizontalEndAlignment class >> rightToLeft [
	^ self left
]

{ #category : #factory }
TbHorizontalEndAlignment >> inverted [
	^ BlElementAlignment vertical end
]

{ #category : #factory }
TbHorizontalEndAlignment >> swap [
	^ BlElementAlignment horizontal start
]
