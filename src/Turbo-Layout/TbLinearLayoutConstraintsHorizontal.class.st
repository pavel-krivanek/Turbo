Class {
	#name : 'TbLinearLayoutConstraintsHorizontal',
	#superclass : 'TbLayoutConstraintsAxis',
	#instVars : [
		'alignment'
	],
	#category : 'Turbo-Layout-Linear',
	#package : 'Turbo-Layout',
	#tag : 'Linear'
}

{ #category : 'alignment' }
TbLinearLayoutConstraintsHorizontal >> alignCenter [
	alignment := TbElementAlignment horizontal center
]

{ #category : 'alignment' }
TbLinearLayoutConstraintsHorizontal >> alignLeft [
	alignment := TbElementAlignment horizontal start
]

{ #category : 'alignment' }
TbLinearLayoutConstraintsHorizontal >> alignRight [
	alignment := TbElementAlignment horizontal end
]

{ #category : 'accessing' }
TbLinearLayoutConstraintsHorizontal >> alignment [
	^ alignment
]

{ #category : 'accessing' }
TbLinearLayoutConstraintsHorizontal >> alignment: aBlElementAlignment [
	alignment := aBlElementAlignment
]

{ #category : 'initialization' }
TbLinearLayoutConstraintsHorizontal >> initialize [
	super initialize.
	
	alignment := TbElementAlignment null horizontal
]
