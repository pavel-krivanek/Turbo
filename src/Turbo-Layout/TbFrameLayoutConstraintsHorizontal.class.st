Class {
	#name : 'TbFrameLayoutConstraintsHorizontal',
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
TbFrameLayoutConstraintsHorizontal >> alignCenter [
	alignment := TbElementAlignment horizontal center
]

{ #category : 'alignment' }
TbFrameLayoutConstraintsHorizontal >> alignLeft [
	alignment := TbElementAlignment horizontal start
]

{ #category : 'alignment' }
TbFrameLayoutConstraintsHorizontal >> alignRight [
	alignment := TbElementAlignment horizontal end
]

{ #category : 'accessing' }
TbFrameLayoutConstraintsHorizontal >> alignment [
	^ alignment
]

{ #category : 'accessing' }
TbFrameLayoutConstraintsHorizontal >> alignment: aBlElementAlignment [
	alignment := aBlElementAlignment
]

{ #category : 'initialization' }
TbFrameLayoutConstraintsHorizontal >> initialize [
	super initialize.
	
	alignment := TbElementAlignment horizontal null.
	weight := 1.0
]

{ #category : 'accessing' }
TbFrameLayoutConstraintsHorizontal >> weight [
	<return: #Number>

	^ weight
]

{ #category : 'accessing' }
TbFrameLayoutConstraintsHorizontal >> weight: aNumber [
	self
		assert: [ aNumber isNotNil ]
		description: [ 'Weight can not be nil' ].
	self
		assert: [ aNumber >= 0 ]
		description: [ 'Weight can not be negative' ].

	weight := aNumber
]
