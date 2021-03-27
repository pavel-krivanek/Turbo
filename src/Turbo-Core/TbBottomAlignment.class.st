Class {
	#name : #TbBottomAlignment,
	#superclass : #TbVerticalAlignment,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #'class initialization' }
TbBottomAlignment class >> initialize [
	super initialize.
]

{ #category : #factory }
TbBottomAlignment class >> leftToRight [
	^ self bottom
]

{ #category : #factory }
TbBottomAlignment class >> rightToLeft [
	^ self bottom
]

{ #category : #factory }
TbBottomAlignment >> inverted [
	^ BlElementAlignment horizontal end
]

{ #category : #factory }
TbBottomAlignment >> swap [
	^ BlElementAlignment top
]

{ #category : #translation }
TbBottomAlignment >> translationOf: aBounds in: aContainerBounds [
	<return: #Point>
	
	^ 0 @ (aContainerBounds height - aBounds height + aContainerBounds top - aBounds top)
]
