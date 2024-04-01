Class {
	#name : #TbHorizontalStartAlignment,
	#superclass : #TbHorizontalAlignment,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #'class initialization' }
TbHorizontalStartAlignment class >> initialize [
	super initialize.
]

{ #category : #factory }
TbHorizontalStartAlignment class >> leftToRight [
	^ self left
]

{ #category : #factory }
TbHorizontalStartAlignment class >> rightToLeft [
	^ self right
]

{ #category : #factory }
TbHorizontalStartAlignment >> inverted [
	^ TbElementAlignment vertical start
]

{ #category : #factory }
TbHorizontalStartAlignment >> swap [
	^ TbElementAlignment horizontal end
]
