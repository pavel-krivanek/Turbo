Class {
	#name : 'TbFlowLayoutConstraintsHorizontal',
	#superclass : 'TbLayoutConstraintsAxis',
	#instVars : [
		'alignment'
	],
	#category : 'Turbo-Layout-Flow',
	#package : 'Turbo-Layout',
	#tag : 'Flow'
}

{ #category : 'alignment' }
TbFlowLayoutConstraintsHorizontal >> alignCenter [
	alignment := TbElementAlignment horizontal center
]

{ #category : 'alignment' }
TbFlowLayoutConstraintsHorizontal >> alignLeft [
	alignment := TbElementAlignment horizontal start
]

{ #category : 'alignment' }
TbFlowLayoutConstraintsHorizontal >> alignRight [
	alignment := TbElementAlignment horizontal end
]

{ #category : 'accessing' }
TbFlowLayoutConstraintsHorizontal >> alignment [
	^ alignment
]

{ #category : 'initialization' }
TbFlowLayoutConstraintsHorizontal >> initialize [
	super initialize.
	
	alignment := TbElementAlignment start horizontal
]
