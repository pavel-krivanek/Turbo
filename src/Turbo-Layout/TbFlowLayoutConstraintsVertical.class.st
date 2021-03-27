Class {
	#name : #TbFlowLayoutConstraintsVertical,
	#superclass : #TbLayoutConstraintsAxis,
	#instVars : [
		'alignment'
	],
	#category : #'Turbo-Layout-Flow'
}

{ #category : #alignment }
TbFlowLayoutConstraintsVertical >> alignBottom [
	alignment := BlElementAlignment vertical end
]

{ #category : #alignment }
TbFlowLayoutConstraintsVertical >> alignCenter [
	alignment := BlElementAlignment vertical center
]

{ #category : #alignment }
TbFlowLayoutConstraintsVertical >> alignTop [
	alignment := BlElementAlignment vertical start
]

{ #category : #accessing }
TbFlowLayoutConstraintsVertical >> alignment [
	^ alignment
]

{ #category : #initialization }
TbFlowLayoutConstraintsVertical >> initialize [
	super initialize.
	
	alignment := BlElementAlignment start vertical
]
