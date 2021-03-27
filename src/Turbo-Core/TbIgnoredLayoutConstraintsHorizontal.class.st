Class {
	#name : #TbIgnoredLayoutConstraintsHorizontal,
	#superclass : #TbLayoutConstraintsAxis,
	#instVars : [
		'alignment',
		'weight'
	],
	#category : #'Turbo-Core-Layouts-Basic'
}

{ #category : #alignment }
TbIgnoredLayoutConstraintsHorizontal >> alignCenter [
	alignment := BlElementAlignment horizontal center
]

{ #category : #alignment }
TbIgnoredLayoutConstraintsHorizontal >> alignLeft [
	alignment := BlElementAlignment horizontal start
]

{ #category : #alignment }
TbIgnoredLayoutConstraintsHorizontal >> alignRight [
	alignment := BlElementAlignment horizontal end
]

{ #category : #accessing }
TbIgnoredLayoutConstraintsHorizontal >> alignment [
	^ alignment
]

{ #category : #initialization }
TbIgnoredLayoutConstraintsHorizontal >> initialize [
	super initialize.
	
	alignment := BlElementAlignment horizontal null.
	weight := 1.0
]

{ #category : #accessing }
TbIgnoredLayoutConstraintsHorizontal >> weight [
	<return: #Number>

	^ weight
]

{ #category : #accessing }
TbIgnoredLayoutConstraintsHorizontal >> weight: aNumber [
	self
		assert: [ aNumber isNotNil ]
		description: [ 'Weight can not be nil' ].
	self
		assert: [ aNumber >= 0 ]
		description: [ 'Weight can not be negative' ].

	weight := aNumber
]
