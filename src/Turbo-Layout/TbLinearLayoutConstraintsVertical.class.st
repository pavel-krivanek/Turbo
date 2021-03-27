Class {
	#name : #TbLinearLayoutConstraintsVertical,
	#superclass : #TbLayoutConstraintsAxis,
	#instVars : [
		'alignment'
	],
	#category : #'Turbo-Layout-Linear'
}

{ #category : #alignment }
TbLinearLayoutConstraintsVertical >> alignBottom [
	alignment := BlElementAlignment vertical end
]

{ #category : #alignment }
TbLinearLayoutConstraintsVertical >> alignCenter [
	alignment := BlElementAlignment vertical center
]

{ #category : #alignment }
TbLinearLayoutConstraintsVertical >> alignTop [
	alignment := BlElementAlignment vertical start
]

{ #category : #accessing }
TbLinearLayoutConstraintsVertical >> alignment [
	^ alignment
]

{ #category : #accessing }
TbLinearLayoutConstraintsVertical >> alignment: aBlElementAlignment [
	alignment := aBlElementAlignment
]

{ #category : #initialization }
TbLinearLayoutConstraintsVertical >> initialize [
	super initialize.
	
	alignment := BlElementAlignment null vertical
]
