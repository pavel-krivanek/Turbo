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
	alignment := TbElementAlignment vertical end
]

{ #category : #alignment }
TbLinearLayoutConstraintsVertical >> alignCenter [
	alignment := TbElementAlignment vertical center
]

{ #category : #alignment }
TbLinearLayoutConstraintsVertical >> alignTop [
	alignment := TbElementAlignment vertical start
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
	
	alignment := TbElementAlignment null vertical
]
