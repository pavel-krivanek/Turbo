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
	alignment := TbElementAlignment vertical end
]

{ #category : #alignment }
TbFlowLayoutConstraintsVertical >> alignCenter [
	alignment := TbElementAlignment vertical center
]

{ #category : #alignment }
TbFlowLayoutConstraintsVertical >> alignTop [
	alignment := TbElementAlignment vertical start
]

{ #category : #accessing }
TbFlowLayoutConstraintsVertical >> alignment [
	^ alignment
]

{ #category : #initialization }
TbFlowLayoutConstraintsVertical >> initialize [
	super initialize.
	
	alignment := TbElementAlignment start vertical
]
