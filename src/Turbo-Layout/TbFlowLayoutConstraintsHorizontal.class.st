Class {
	#name : #TbFlowLayoutConstraintsHorizontal,
	#superclass : #TbLayoutConstraintsAxis,
	#instVars : [
		'alignment'
	],
	#category : #'Turbo-Layout-Flow'
}

{ #category : #alignment }
TbFlowLayoutConstraintsHorizontal >> alignCenter [
	alignment := BlElementAlignment horizontal center
]

{ #category : #alignment }
TbFlowLayoutConstraintsHorizontal >> alignLeft [
	alignment := BlElementAlignment horizontal start
]

{ #category : #alignment }
TbFlowLayoutConstraintsHorizontal >> alignRight [
	alignment := BlElementAlignment horizontal end
]

{ #category : #accessing }
TbFlowLayoutConstraintsHorizontal >> alignment [
	^ alignment
]

{ #category : #initialization }
TbFlowLayoutConstraintsHorizontal >> initialize [
	super initialize.
	
	alignment := BlElementAlignment start horizontal
]
