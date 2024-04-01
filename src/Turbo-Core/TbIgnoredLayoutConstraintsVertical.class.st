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
	alignment := TbElementAlignment vertical end
]

{ #category : #alignment }
TbIgnoredLayoutConstraintsVertical >> alignCenter [
	alignment := TbElementAlignment vertical center
]

{ #category : #alignment }
TbIgnoredLayoutConstraintsVertical >> alignTop [
	alignment := TbElementAlignment vertical start
]

{ #category : #accessing }
TbIgnoredLayoutConstraintsVertical >> alignment [
	^ alignment
]

{ #category : #initialization }
TbIgnoredLayoutConstraintsVertical >> initialize [
	super initialize.
	
	alignment := TbElementAlignment vertical null.
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
