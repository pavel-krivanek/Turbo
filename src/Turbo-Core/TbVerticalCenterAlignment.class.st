Class {
	#name : #TbVerticalCenterAlignment,
	#superclass : #TbVerticalAlignment,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #'class initialization' }
TbVerticalCenterAlignment class >> initialize [
	super initialize
]

{ #category : #factory }
TbVerticalCenterAlignment class >> leftToRight [
	^ self center
]

{ #category : #factory }
TbVerticalCenterAlignment class >> rightToLeft [
	^ self center
]

{ #category : #factory }
TbVerticalCenterAlignment >> inverted [
	^ TbElementAlignment horizontal center
]

{ #category : #factory }
TbVerticalCenterAlignment >> swap [
	^ self
]

{ #category : #translation }
TbVerticalCenterAlignment >> translationOf: aBounds in: aContainerBounds [
	<return: #Point>
	
	^ 0 @ ((aContainerBounds height - aBounds height) / 2.0 + aContainerBounds top - aBounds top)
]
