Class {
	#name : #TbLinearLayoutConstraintsHorizontal,
	#superclass : #TbLayoutConstraintsAxis,
	#instVars : [
		'alignment'
	],
	#category : #'Turbo-Layout-Linear'
}

{ #category : #alignment }
TbLinearLayoutConstraintsHorizontal >> alignCenter [
	alignment := BlElementAlignment horizontal center
]

{ #category : #alignment }
TbLinearLayoutConstraintsHorizontal >> alignLeft [
	alignment := BlElementAlignment horizontal start
]

{ #category : #alignment }
TbLinearLayoutConstraintsHorizontal >> alignRight [
	alignment := BlElementAlignment horizontal end
]

{ #category : #accessing }
TbLinearLayoutConstraintsHorizontal >> alignment [
	^ alignment
]

{ #category : #accessing }
TbLinearLayoutConstraintsHorizontal >> alignment: aBlElementAlignment [
	alignment := aBlElementAlignment
]

{ #category : #initialization }
TbLinearLayoutConstraintsHorizontal >> initialize [
	super initialize.
	
	alignment := BlElementAlignment null horizontal
]
