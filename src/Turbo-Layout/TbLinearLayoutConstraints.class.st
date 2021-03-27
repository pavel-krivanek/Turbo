Class {
	#name : #TbLinearLayoutConstraints,
	#superclass : #TbLayoutConstraints,
	#instVars : [
		'weight'
	],
	#category : #'Turbo-Layout-Linear'
}

{ #category : #alignment }
TbLinearLayoutConstraints >> alignment [
	^ self horizontal alignment + self vertical alignment
]

{ #category : #initialization }
TbLinearLayoutConstraints >> defaultHorizontal [
	^ TbLinearLayoutConstraintsHorizontal new
]

{ #category : #initialization }
TbLinearLayoutConstraints >> defaultVertical [
	^ TbLinearLayoutConstraintsVertical new
]

{ #category : #initialization }
TbLinearLayoutConstraints >> initialize [
	super initialize.
	
	weight := 1
]

{ #category : #weight }
TbLinearLayoutConstraints >> weight [
	"Return weight that defines how much space an element takes within parent's available space.
	weight can not be nil and is always non negative"
	<return: #Number>

	^ weight
]

{ #category : #weight }
TbLinearLayoutConstraints >> weight: aNumber [
	"Set new weight value that defines how much space an element takes within parent's available space.
	aNumber must not be nil
	aNumber must be non negative
	aNumber must not be infinite"
	self
		assert: [ aNumber isNotNil ]
		description: [ 'Weight can not be nil' ].
		
	self
		assert: [ aNumber >= 0 ]
		description: [ 'Weight must be non negative' ].
	
	self
		assert: [ aNumber < Float infinity ]
		description: [ 'Weight must not be infinite' ].

	weight := aNumber
]
