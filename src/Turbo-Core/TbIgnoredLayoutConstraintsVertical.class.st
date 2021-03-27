Class {
	#name : #TbIgnoredLayoutConstraintsVertical,
	#superclass : #TbLayoutConstraintsAxis,
	#instVars : [
		'alignment',
		'weight'
	],
	#category : #'Turbo-Core-Layouts-Basic'
}

{ #category : #alignment }
TbIgnoredLayoutConstraintsVertical >> alignBottom [
	alignment := BlElementAlignment vertical end
]

{ #category : #alignment }
TbIgnoredLayoutConstraintsVertical >> alignCenter [
	alignment := BlElementAlignment vertical center
]

{ #category : #alignment }
TbIgnoredLayoutConstraintsVertical >> alignTop [
	alignment := BlElementAlignment vertical start
]

{ #category : #accessing }
TbIgnoredLayoutConstraintsVertical >> alignment [
	^ alignment
]

{ #category : #initialization }
TbIgnoredLayoutConstraintsVertical >> initialize [
	super initialize.
	
	alignment := BlElementAlignment vertical null.
	weight := 1.0
]

{ #category : #accessing }
TbIgnoredLayoutConstraintsVertical >> weight [
	<return: #Number>

	^ weight
]

{ #category : #accessing }
TbIgnoredLayoutConstraintsVertical >> weight: aNumber [
	self
		assert: [ aNumber isNotNil ]
		description: [ 'Weight can not be nil' ].
	self
		assert: [ aNumber >= 0 ]
		description: [ 'Weight can not be negative' ].

	weight := aNumber
]
