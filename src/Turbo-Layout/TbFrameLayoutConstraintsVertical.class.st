Class {
	#name : 'TbFrameLayoutConstraintsVertical',
	#superclass : 'TbLayoutConstraintsAxis',
	#instVars : [
		'alignment',
		'weight'
	],
	#category : 'Turbo-Layout-Frame',
	#package : 'Turbo-Layout',
	#tag : 'Frame'
}

{ #category : 'alignment' }
TbFrameLayoutConstraintsVertical >> alignBottom [
	alignment := TbElementAlignment vertical end
]

{ #category : 'alignment' }
TbFrameLayoutConstraintsVertical >> alignCenter [
	alignment := TbElementAlignment vertical center
]

{ #category : 'alignment' }
TbFrameLayoutConstraintsVertical >> alignTop [
	alignment := TbElementAlignment vertical start
]

{ #category : 'accessing' }
TbFrameLayoutConstraintsVertical >> alignment [
	^ alignment
]

{ #category : 'alignment' }
TbFrameLayoutConstraintsVertical >> alignment: aBlElementAlignment [
	alignment := aBlElementAlignment
]

{ #category : 'initialization' }
TbFrameLayoutConstraintsVertical >> initialize [
	super initialize.
	
	alignment := TbElementAlignment vertical null.
	weight := 1.0
]

{ #category : 'accessing' }
TbFrameLayoutConstraintsVertical >> weight [
	<return: #Number>

	^ weight
]

{ #category : 'accessing' }
TbFrameLayoutConstraintsVertical >> weight: aNumber [
	self
		assert: [ aNumber isNotNil ]
		description: [ 'Weight can not be nil' ].
	self
		assert: [ aNumber >= 0 ]
		description: [ 'Weight can not be negative' ].

	weight := aNumber
]
